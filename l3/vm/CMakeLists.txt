cmake_minimum_required(VERSION 3.10)
project(vm)

set(CMAKE_CXX_STANDARD 11)

include_directories(src)

add_executable(vm
        bin/vm.dSYM/Contents/Resources/DWARF/vm
        bin/vm.dSYM/Contents/Info.plist
        bin/vm
        src/engine.c
        src/engine.h
        src/fail.c
        src/fail.h
        src/main.c
        src/memory.h
        src/memory_mark_n_sweep.c
        src/memory_nofree.c
        src/opcode.h
        src/vmtypes.h
        test/bignums.asm
        test/maze.asm
        test/queens.asm
        test/unimaze.asm
        Makefile
        README.org)
