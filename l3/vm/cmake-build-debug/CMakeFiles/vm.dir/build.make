# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/Mikael/Documents/l3Compiler/l3/vm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/Mikael/Documents/l3Compiler/l3/vm/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/vm.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/vm.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/vm.dir/flags.make

CMakeFiles/vm.dir/src/engine.c.o: CMakeFiles/vm.dir/flags.make
CMakeFiles/vm.dir/src/engine.c.o: ../src/engine.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/Mikael/Documents/l3Compiler/l3/vm/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/vm.dir/src/engine.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/vm.dir/src/engine.c.o   -c /Users/Mikael/Documents/l3Compiler/l3/vm/src/engine.c

CMakeFiles/vm.dir/src/engine.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vm.dir/src/engine.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/Mikael/Documents/l3Compiler/l3/vm/src/engine.c > CMakeFiles/vm.dir/src/engine.c.i

CMakeFiles/vm.dir/src/engine.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vm.dir/src/engine.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/Mikael/Documents/l3Compiler/l3/vm/src/engine.c -o CMakeFiles/vm.dir/src/engine.c.s

CMakeFiles/vm.dir/src/engine.c.o.requires:

.PHONY : CMakeFiles/vm.dir/src/engine.c.o.requires

CMakeFiles/vm.dir/src/engine.c.o.provides: CMakeFiles/vm.dir/src/engine.c.o.requires
	$(MAKE) -f CMakeFiles/vm.dir/build.make CMakeFiles/vm.dir/src/engine.c.o.provides.build
.PHONY : CMakeFiles/vm.dir/src/engine.c.o.provides

CMakeFiles/vm.dir/src/engine.c.o.provides.build: CMakeFiles/vm.dir/src/engine.c.o


CMakeFiles/vm.dir/src/fail.c.o: CMakeFiles/vm.dir/flags.make
CMakeFiles/vm.dir/src/fail.c.o: ../src/fail.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/Mikael/Documents/l3Compiler/l3/vm/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/vm.dir/src/fail.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/vm.dir/src/fail.c.o   -c /Users/Mikael/Documents/l3Compiler/l3/vm/src/fail.c

CMakeFiles/vm.dir/src/fail.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vm.dir/src/fail.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/Mikael/Documents/l3Compiler/l3/vm/src/fail.c > CMakeFiles/vm.dir/src/fail.c.i

CMakeFiles/vm.dir/src/fail.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vm.dir/src/fail.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/Mikael/Documents/l3Compiler/l3/vm/src/fail.c -o CMakeFiles/vm.dir/src/fail.c.s

CMakeFiles/vm.dir/src/fail.c.o.requires:

.PHONY : CMakeFiles/vm.dir/src/fail.c.o.requires

CMakeFiles/vm.dir/src/fail.c.o.provides: CMakeFiles/vm.dir/src/fail.c.o.requires
	$(MAKE) -f CMakeFiles/vm.dir/build.make CMakeFiles/vm.dir/src/fail.c.o.provides.build
.PHONY : CMakeFiles/vm.dir/src/fail.c.o.provides

CMakeFiles/vm.dir/src/fail.c.o.provides.build: CMakeFiles/vm.dir/src/fail.c.o


CMakeFiles/vm.dir/src/main.c.o: CMakeFiles/vm.dir/flags.make
CMakeFiles/vm.dir/src/main.c.o: ../src/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/Mikael/Documents/l3Compiler/l3/vm/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/vm.dir/src/main.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/vm.dir/src/main.c.o   -c /Users/Mikael/Documents/l3Compiler/l3/vm/src/main.c

CMakeFiles/vm.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vm.dir/src/main.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/Mikael/Documents/l3Compiler/l3/vm/src/main.c > CMakeFiles/vm.dir/src/main.c.i

CMakeFiles/vm.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vm.dir/src/main.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/Mikael/Documents/l3Compiler/l3/vm/src/main.c -o CMakeFiles/vm.dir/src/main.c.s

CMakeFiles/vm.dir/src/main.c.o.requires:

.PHONY : CMakeFiles/vm.dir/src/main.c.o.requires

CMakeFiles/vm.dir/src/main.c.o.provides: CMakeFiles/vm.dir/src/main.c.o.requires
	$(MAKE) -f CMakeFiles/vm.dir/build.make CMakeFiles/vm.dir/src/main.c.o.provides.build
.PHONY : CMakeFiles/vm.dir/src/main.c.o.provides

CMakeFiles/vm.dir/src/main.c.o.provides.build: CMakeFiles/vm.dir/src/main.c.o


CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o: CMakeFiles/vm.dir/flags.make
CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o: ../src/memory_mark_n_sweep.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/Mikael/Documents/l3Compiler/l3/vm/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o   -c /Users/Mikael/Documents/l3Compiler/l3/vm/src/memory_mark_n_sweep.c

CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/Mikael/Documents/l3Compiler/l3/vm/src/memory_mark_n_sweep.c > CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.i

CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/Mikael/Documents/l3Compiler/l3/vm/src/memory_mark_n_sweep.c -o CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.s

CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o.requires:

.PHONY : CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o.requires

CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o.provides: CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o.requires
	$(MAKE) -f CMakeFiles/vm.dir/build.make CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o.provides.build
.PHONY : CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o.provides

CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o.provides.build: CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o


CMakeFiles/vm.dir/src/memory_nofree.c.o: CMakeFiles/vm.dir/flags.make
CMakeFiles/vm.dir/src/memory_nofree.c.o: ../src/memory_nofree.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/Mikael/Documents/l3Compiler/l3/vm/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/vm.dir/src/memory_nofree.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/vm.dir/src/memory_nofree.c.o   -c /Users/Mikael/Documents/l3Compiler/l3/vm/src/memory_nofree.c

CMakeFiles/vm.dir/src/memory_nofree.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vm.dir/src/memory_nofree.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/Mikael/Documents/l3Compiler/l3/vm/src/memory_nofree.c > CMakeFiles/vm.dir/src/memory_nofree.c.i

CMakeFiles/vm.dir/src/memory_nofree.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vm.dir/src/memory_nofree.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/Mikael/Documents/l3Compiler/l3/vm/src/memory_nofree.c -o CMakeFiles/vm.dir/src/memory_nofree.c.s

CMakeFiles/vm.dir/src/memory_nofree.c.o.requires:

.PHONY : CMakeFiles/vm.dir/src/memory_nofree.c.o.requires

CMakeFiles/vm.dir/src/memory_nofree.c.o.provides: CMakeFiles/vm.dir/src/memory_nofree.c.o.requires
	$(MAKE) -f CMakeFiles/vm.dir/build.make CMakeFiles/vm.dir/src/memory_nofree.c.o.provides.build
.PHONY : CMakeFiles/vm.dir/src/memory_nofree.c.o.provides

CMakeFiles/vm.dir/src/memory_nofree.c.o.provides.build: CMakeFiles/vm.dir/src/memory_nofree.c.o


# Object files for target vm
vm_OBJECTS = \
"CMakeFiles/vm.dir/src/engine.c.o" \
"CMakeFiles/vm.dir/src/fail.c.o" \
"CMakeFiles/vm.dir/src/main.c.o" \
"CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o" \
"CMakeFiles/vm.dir/src/memory_nofree.c.o"

# External object files for target vm
vm_EXTERNAL_OBJECTS =

vm: CMakeFiles/vm.dir/src/engine.c.o
vm: CMakeFiles/vm.dir/src/fail.c.o
vm: CMakeFiles/vm.dir/src/main.c.o
vm: CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o
vm: CMakeFiles/vm.dir/src/memory_nofree.c.o
vm: CMakeFiles/vm.dir/build.make
vm: CMakeFiles/vm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/Mikael/Documents/l3Compiler/l3/vm/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C executable vm"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/vm.dir/build: vm

.PHONY : CMakeFiles/vm.dir/build

CMakeFiles/vm.dir/requires: CMakeFiles/vm.dir/src/engine.c.o.requires
CMakeFiles/vm.dir/requires: CMakeFiles/vm.dir/src/fail.c.o.requires
CMakeFiles/vm.dir/requires: CMakeFiles/vm.dir/src/main.c.o.requires
CMakeFiles/vm.dir/requires: CMakeFiles/vm.dir/src/memory_mark_n_sweep.c.o.requires
CMakeFiles/vm.dir/requires: CMakeFiles/vm.dir/src/memory_nofree.c.o.requires

.PHONY : CMakeFiles/vm.dir/requires

CMakeFiles/vm.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/vm.dir/cmake_clean.cmake
.PHONY : CMakeFiles/vm.dir/clean

CMakeFiles/vm.dir/depend:
	cd /Users/Mikael/Documents/l3Compiler/l3/vm/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/Mikael/Documents/l3Compiler/l3/vm /Users/Mikael/Documents/l3Compiler/l3/vm /Users/Mikael/Documents/l3Compiler/l3/vm/cmake-build-debug /Users/Mikael/Documents/l3Compiler/l3/vm/cmake-build-debug /Users/Mikael/Documents/l3Compiler/l3/vm/cmake-build-debug/CMakeFiles/vm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/vm.dir/depend
