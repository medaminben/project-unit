# common utilities for CMake,
# Include this file as early as possible 
#in the top CMakeLists.txt

# Use C++ 17 for nested namespaces 
#and other new features 
set(CMAKE_CXX_STANDARD 17)
# some custom functions and macros
include(BuildUtils)
include(DebugUtils)

# Standard settings for build location:
include(BuildLocation)


if(BUILD_VERBOSE_OUTPUT)
    set(CMAKE_VERBOSE_MAKEFILE ON)
    dump_cmake_vars(configLog.log)
endif()

if(CMAKE_COMPILER_IS_GNUCXX 
    OR CMAKE_CXX_COMPILER_ID MATCHES Clang)
    # Activate all warnings 
    # and consider warnings as errors
    set(CMAKE_C_FLAGS 
    "${CMAKE_CXX_FLAGS} -Wall -Werror"
    )
    set(CMAKE_CXX_FLAGS 
    "${CMAKE_CXX_FLAGS} -Wall -Werror"
    )
endif()
