# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/xialb/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/211.7142.21/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/xialb/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/211.7142.21/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/read_file_c.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/read_file_c.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/read_file_c.dir/flags.make

CMakeFiles/read_file_c.dir/ReadFileC.c.o: CMakeFiles/read_file_c.dir/flags.make
CMakeFiles/read_file_c.dir/ReadFileC.c.o: ../ReadFileC.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/read_file_c.dir/ReadFileC.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/read_file_c.dir/ReadFileC.c.o -c /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/ReadFileC.c

CMakeFiles/read_file_c.dir/ReadFileC.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/read_file_c.dir/ReadFileC.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/ReadFileC.c > CMakeFiles/read_file_c.dir/ReadFileC.c.i

CMakeFiles/read_file_c.dir/ReadFileC.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/read_file_c.dir/ReadFileC.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/ReadFileC.c -o CMakeFiles/read_file_c.dir/ReadFileC.c.s

CMakeFiles/read_file_c.dir/main.c.o: CMakeFiles/read_file_c.dir/flags.make
CMakeFiles/read_file_c.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/read_file_c.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/read_file_c.dir/main.c.o -c /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/main.c

CMakeFiles/read_file_c.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/read_file_c.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/main.c > CMakeFiles/read_file_c.dir/main.c.i

CMakeFiles/read_file_c.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/read_file_c.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/main.c -o CMakeFiles/read_file_c.dir/main.c.s

# Object files for target read_file_c
read_file_c_OBJECTS = \
"CMakeFiles/read_file_c.dir/ReadFileC.c.o" \
"CMakeFiles/read_file_c.dir/main.c.o"

# External object files for target read_file_c
read_file_c_EXTERNAL_OBJECTS =

libread_file_c.so: CMakeFiles/read_file_c.dir/ReadFileC.c.o
libread_file_c.so: CMakeFiles/read_file_c.dir/main.c.o
libread_file_c.so: CMakeFiles/read_file_c.dir/build.make
libread_file_c.so: CMakeFiles/read_file_c.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared library libread_file_c.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/read_file_c.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/read_file_c.dir/build: libread_file_c.so

.PHONY : CMakeFiles/read_file_c.dir/build

CMakeFiles/read_file_c.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/read_file_c.dir/cmake_clean.cmake
.PHONY : CMakeFiles/read_file_c.dir/clean

CMakeFiles/read_file_c.dir/depend:
	cd /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/cmake-build-debug /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/cmake-build-debug /home/xialb/ihep/spark_bk/examples/src/main/scala/org/apache/spark/examples/lqcd/jni/cmake-build-debug/CMakeFiles/read_file_c.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/read_file_c.dir/depend

