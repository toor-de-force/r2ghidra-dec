# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tej/github/Ghidrall/ghidrall/tests

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tej/github/Ghidrall/ghidrall/tests/build

# Include any dependencies generated for this target.
include CMakeFiles/global_var_nongoal.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/global_var_nongoal.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/global_var_nongoal.dir/flags.make

CMakeFiles/global_var_nongoal.dir/global_var_nongoal.cpp.o: CMakeFiles/global_var_nongoal.dir/flags.make
CMakeFiles/global_var_nongoal.dir/global_var_nongoal.cpp.o: ../global_var_nongoal.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tej/github/Ghidrall/ghidrall/tests/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/global_var_nongoal.dir/global_var_nongoal.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/global_var_nongoal.dir/global_var_nongoal.cpp.o -c /home/tej/github/Ghidrall/ghidrall/tests/global_var_nongoal.cpp

CMakeFiles/global_var_nongoal.dir/global_var_nongoal.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/global_var_nongoal.dir/global_var_nongoal.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tej/github/Ghidrall/ghidrall/tests/global_var_nongoal.cpp > CMakeFiles/global_var_nongoal.dir/global_var_nongoal.cpp.i

CMakeFiles/global_var_nongoal.dir/global_var_nongoal.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/global_var_nongoal.dir/global_var_nongoal.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tej/github/Ghidrall/ghidrall/tests/global_var_nongoal.cpp -o CMakeFiles/global_var_nongoal.dir/global_var_nongoal.cpp.s

# Object files for target global_var_nongoal
global_var_nongoal_OBJECTS = \
"CMakeFiles/global_var_nongoal.dir/global_var_nongoal.cpp.o"

# External object files for target global_var_nongoal
global_var_nongoal_EXTERNAL_OBJECTS =

global_var_nongoal: CMakeFiles/global_var_nongoal.dir/global_var_nongoal.cpp.o
global_var_nongoal: CMakeFiles/global_var_nongoal.dir/build.make
global_var_nongoal: CMakeFiles/global_var_nongoal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tej/github/Ghidrall/ghidrall/tests/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable global_var_nongoal"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/global_var_nongoal.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/global_var_nongoal.dir/build: global_var_nongoal

.PHONY : CMakeFiles/global_var_nongoal.dir/build

CMakeFiles/global_var_nongoal.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/global_var_nongoal.dir/cmake_clean.cmake
.PHONY : CMakeFiles/global_var_nongoal.dir/clean

CMakeFiles/global_var_nongoal.dir/depend:
	cd /home/tej/github/Ghidrall/ghidrall/tests/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tej/github/Ghidrall/ghidrall/tests /home/tej/github/Ghidrall/ghidrall/tests /home/tej/github/Ghidrall/ghidrall/tests/build /home/tej/github/Ghidrall/ghidrall/tests/build /home/tej/github/Ghidrall/ghidrall/tests/build/CMakeFiles/global_var_nongoal.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/global_var_nongoal.dir/depend
