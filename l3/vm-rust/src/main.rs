mod memory_nofree;
mod engine;

use std::env;
use std::fs::File;
use std::io::{BufReader, BufRead};

use engine::Engine;
use memory_nofree::Memory;

pub type L3Value = i32;
pub const LOG2_VALUE_BYTES : usize = 2;
pub const LOG2_VALUE_BITS  : usize = 5;
pub const VALUE_BITS       : usize = 1 << LOG2_VALUE_BITS;

fn load(file_name: &str, mem: &mut Memory) {
    if let Ok(file) = File::open(file_name) {
        let mut index: usize = 0;
        for maybe_line in BufReader::new(file).lines() {
            if let Ok(line) = maybe_line {
                if let Ok(instr) = i32::from_str_radix(&line[0..8], 16) {
                    mem[index] = instr;
                    index += 1;
                } else {
                    panic!("cannot parse line: <{}>", line);
                }
            } else {
                panic!("error while reading file");
            }
        }
        mem.set_heap_start(index);
    } else {
        panic!("cannot open file {}", file_name);
    }
}

fn actual_main() -> i32 {
    let args: Vec<String> = env::args().collect();
    let mut mem = Memory::new(1_000_000 >> 2);
    load(args[1].as_str(), &mut mem);
    let mut eng = Engine::new(mem);
    eng.run()
}

fn main() {
    std::process::exit(actual_main());
}
