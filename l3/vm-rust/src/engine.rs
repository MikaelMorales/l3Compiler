use std::io;

use memory_nofree::Memory;
use {L3Value, LOG2_VALUE_BYTES};

const TAG_REGISTER_FRAME : L3Value = 201;

const ADD  : L3Value =  0;
const SUB  : L3Value =  1;
const MUL  : L3Value =  2;
const DIV  : L3Value =  3;
const MOD  : L3Value =  4;
const LSL  : L3Value =  5;
const LSR  : L3Value =  6;
const AND  : L3Value =  7;
const OR   : L3Value =  8;
const XOR  : L3Value =  9;
const JLT  : L3Value = 10;
const JLE  : L3Value = 11;
const JEQ  : L3Value = 12;
const JNE  : L3Value = 13;
const JI   : L3Value = 14;
const TCAL : L3Value = 15;
const CALL : L3Value = 16;
const RET  : L3Value = 17;
const HALT : L3Value = 18;
const LDLO : L3Value = 19;
const LDHI : L3Value = 20;
const MOVE : L3Value = 21;
const RALO : L3Value = 22;
const BALO : L3Value = 23;
const BSIZ : L3Value = 24;
const BTAG : L3Value = 25;
const BGET : L3Value = 26;
const BSET : L3Value = 27;
const BREA : L3Value = 28;
const BWRI : L3Value = 29;

pub struct Engine {
    ib: usize,
    lb: usize,
    ob: usize,
    mem: Memory,
}

fn extract_u(instr: L3Value, start: u32, len: u32) -> L3Value {
    (instr >> start) & ((1 << len) - 1)
}

fn extract_s(instr: L3Value, start: u32, len: u32) -> L3Value {
    let bits = extract_u(instr, start, len);
    let m = 1 << (len - 1);
    (bits ^ m) - m
}

fn opcode(instr: L3Value) -> L3Value {
    extract_u(instr, 26, 6)
}

fn index_to_address(index: usize) -> L3Value {
    (index << LOG2_VALUE_BYTES) as L3Value
}

fn address_to_index(addr: L3Value) -> usize {
    debug_assert!(addr & ((1 << LOG2_VALUE_BYTES) - 1) == 0,
                  "invalid address: {} (16#{:x})", addr, addr);
    (addr >> LOG2_VALUE_BYTES) as usize
}

fn offset_pc(pc: usize, offset: L3Value) -> usize {
    ((pc as L3Value) + offset) as usize
}

impl Engine {
    pub fn new(mem: Memory) -> Engine {
        Engine { ib: 0, lb: 0, ob: 0, mem: mem }
    }

    fn reg_ix(&self, r: L3Value) -> usize {
        debug_assert!(0 <= r && r <= 0xFF);

        let i = (r & 0x1F) as usize;
        match r >> 5 {
            0 => self.lb + i + 0 * 32,
            1 => self.lb + i + 1 * 32,
            2 => self.lb + i + 2 * 32,
            3 => self.lb + i + 3 * 32,
            4 => self.lb + i + 4 * 32,
            5 => self.lb + i + 5 * 32,
            6 => self.ib + i,
            7 => self.ob + i,
            _ => panic!()
        }
    }

    fn ra_ix(&self, instr: L3Value) -> usize {
        self.reg_ix(extract_u(instr, 18, 8))
    }

    fn rb_ix(&self, instr: L3Value) -> usize {
        self.reg_ix(extract_u(instr, 10, 8))
    }

    fn rc_ix(&self, instr: L3Value) -> usize {
        self.reg_ix(extract_u(instr, 2, 8))
    }

    fn ra(&self, instr: L3Value) -> L3Value {
        self.mem[self.ra_ix(instr)]
    }
    
    fn rb(&self, instr: L3Value) -> L3Value {
        self.mem[self.rb_ix(instr)]
    }
    
    fn rc(&self, instr: L3Value) -> L3Value {
        self.mem[self.rc_ix(instr)]
    }
    
    fn arith<F>(&mut self, instr: L3Value, op: F)
        where F: Fn(L3Value, L3Value) -> L3Value {
        let ra_ix = self.ra_ix(instr);
        let l = self.rb(instr);
        let r = self.rc(instr);
        self.mem[ra_ix] = op(l, r)
    }

    fn cond_pc<F>(&mut self, pc: usize, instr: L3Value, op: F) -> usize
        where F: Fn(L3Value, L3Value) -> bool {
        let l = self.ra(instr);
        let r = self.rb(instr);
        offset_pc(pc, if op(l, r) { extract_s(instr, 0, 10) } else { 1 })
    }

    pub fn run(&mut self) -> L3Value {
        let mut pc: usize = 0;

        loop {
            let inst = self.mem[pc];
            let opcode = opcode(inst);

            match opcode {
                ADD => {
                    self.arith(inst, |x, y| x.wrapping_add(y));
                    pc += 1;
                }
                SUB => {
                    self.arith(inst, |x, y| x.wrapping_sub(y));
                    pc += 1;
                }
                MUL => {
                    self.arith(inst, |x, y| x.wrapping_mul(y));
                    pc += 1;
                }
                DIV => {
                    self.arith(inst, |x, y| x.wrapping_div(y));
                    pc += 1;
                }
                MOD => {
                    self.arith(inst, |x, y| x.wrapping_rem(y));
                    pc += 1;
                }
                LSL => {
                    self.arith(inst, |x, y| x.wrapping_shl(y as u32));
                    pc += 1;
                }
                LSR => {
                    self.arith(inst, |x, y| x.wrapping_shr(y as u32));
                    pc += 1;
                }
                AND => {
                    self.arith(inst, |x, y| x & y);
                    pc += 1;
                }
                OR => {
                    self.arith(inst, |x, y| x | y);
                    pc += 1;
                }
                XOR => {
                    self.arith(inst, |x, y| x ^ y);
                    pc += 1;
                }
                JLT => {
                    pc = self.cond_pc(pc, inst, |x, y| x < y)
                }
                JLE => {
                    pc = self.cond_pc(pc, inst, |x, y| x <= y)
                }
                JEQ => {
                    pc = self.cond_pc(pc, inst, |x, y| x == y)
                }
                JNE => {
                    pc = self.cond_pc(pc, inst, |x, y| x != y)
                }
                JI => {
                    pc = offset_pc(pc, extract_s(inst, 0, 26))
                }
                TCAL => {
                    let target_pc = address_to_index(self.ra(inst));
                    let ctx0 = self.mem[self.ib + 0];
                    let ctx1 = self.mem[self.ib + 1];
                    let ctx2 = self.mem[self.ib + 2];
                    let ctx3 = self.mem[self.ib + 3];
                    let new_ib = self.ob;
                    self.ib = new_ib;
                    self.lb = 0;
                    self.ob = 0;
                    self.mem[new_ib + 0] = ctx0;
                    self.mem[new_ib + 1] = ctx1;
                    self.mem[new_ib + 2] = ctx2;
                    self.mem[new_ib + 3] = ctx3;
                    pc = target_pc;
                }
                CALL => {
                    let target_pc = address_to_index(self.ra(inst));
                    let ctx0 = self.ib;
                    let ctx1 = self.lb;
                    let ctx2 = self.ob;
                    let ctx3 = pc + 1;
                    let new_ib = self.ob;
                    self.ib = new_ib;
                    self.lb = 0;
                    self.ob = 0;
                    self.mem[new_ib + 0] = index_to_address(ctx0);
                    self.mem[new_ib + 1] = index_to_address(ctx1);
                    self.mem[new_ib + 2] = index_to_address(ctx2);
                    self.mem[new_ib + 3] = index_to_address(ctx3);
                    pc = target_pc;
                }
                RET => {
                    let ret_value = self.mem[self.ib + 4];
                    let ret_pc = address_to_index(self.mem[self.ib + 3]);
                    let ret_ob = address_to_index(self.mem[self.ib + 2]);
                    let ret_lb = address_to_index(self.mem[self.ib + 1]);
                    let ret_ib = address_to_index(self.mem[self.ib + 0]);
                    self.mem[ret_ob + 0] = ret_value;
                    self.ob = ret_ob;
                    self.lb = ret_lb;
                    self.ib = ret_ib;
                    pc = ret_pc;
                }
                HALT => {
                    return self.ra(inst);
                }
                LDLO => {
                    let ra_ix = self.ra_ix(inst);
                    self.mem[ra_ix] = extract_s(inst, 0, 18);
                    pc += 1;
                }
                LDHI => {
                    let ra_ix = self.ra_ix(inst);
                    let hi = extract_u(inst, 0, 16) << 16;
                    let lo = self.mem[ra_ix] & 0xFFFF;
                    self.mem[ra_ix] = hi | lo;
                    pc += 1;
                }
                MOVE => {
                    let ra_ix = self.ra_ix(inst);
                    let rb = self.rb(inst);
                    self.mem[ra_ix] = rb;
                    pc += 1;
                }
                RALO => {
                    let size = extract_u(inst, 16, 8);
                    let gc_roots = [self.ib, self.lb, self.ob];
                    let b_ix = self.mem.allocate(TAG_REGISTER_FRAME,
                                                 size,
                                                 gc_roots);
                    match extract_u(inst, 24, 2) {
                        0 => self.lb = b_ix,
                        1 => self.ib = b_ix,
                        2 => self.ob = b_ix,
                        _ => panic!()
                    };
                    pc += 1;
                }
                BALO => {
                    let tag = extract_u(inst, 2, 8);
                    let size = self.rb(inst);
                    let gc_roots = [self.ib, self.lb, self.ob];
                    let block_ix = self.mem.allocate(tag, size, gc_roots);
                    let ra_ix = self.ra_ix(inst);
                    self.mem[ra_ix] = index_to_address(block_ix);
                    pc += 1;
                }
                BSIZ => {
                    let block_ix = address_to_index(self.rb(inst));
                    let size = self.mem.block_size(block_ix);
                    let ra_ix = self.ra_ix(inst);
                    self.mem[ra_ix] = size;
                    pc += 1;
                }
                BTAG => {
                    let block_ix = address_to_index(self.rb(inst));
                    let tag = self.mem.block_tag(block_ix);
                    let ra_ix = self.ra_ix(inst);
                    self.mem[ra_ix] = tag;
                    pc += 1;
                }
                BGET => {
                    let block_ix = address_to_index(self.rb(inst));
                    let index = self.rc(inst) as usize;
                    let value = self.mem[block_ix + index];
                    let ra_ix = self.ra_ix(inst);
                    self.mem[ra_ix] = value;
                    pc += 1;
                }
                BSET => {
                    let block_ix = address_to_index(self.rb(inst));
                    let index = self.rc(inst) as usize;
                    let value = self.ra(inst);
                    self.mem[block_ix + index] = value;
                    pc += 1;
                }
                BREA => {
                    use std::io::{Read,Write};

                    io::stdout().flush().expect("flush error");

                    let ra_ix = self.ra_ix(inst);
                    let mut byte = [0u8; 1];
                    match io::stdin().read(&mut byte) {
                        Ok(1) => self.mem[ra_ix] = byte[0] as L3Value,
                        _     => self.mem[ra_ix] = -1
                    };
                    pc += 1;
                }
                BWRI => {
                    use std::io::Write;

                    let byte = [self.ra(inst) as u8; 1];
                    io::stdout().write(&byte).expect("write error");
                    pc += 1;
                }
                _ =>
                    panic!("unknown opcode {}", opcode)
            }
        }
    }
}
