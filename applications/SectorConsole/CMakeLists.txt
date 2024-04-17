project(SectorConsole VERSION 1.0.1 LANGUAGES CXX)

# Don't use PROJECT_NAME as target name, 
# using a proper executable name gives 
# more freedom 
set(EXECUTABLE_NAME ${PROJECT_NAME})

# will be used to check building it or not
# will be needed in case of missing 3rdparty 
# dependencies to reject the build (example of 
# usage: an app depends on boost and boost is 
# not available also better to discard building here)
set(BUILD_THIS_EXEC ON)

# define The WIN32 Flag (needed for ui on windows) 
set(IS_UI OFF)

# Manage executable files
# header files
set(PROJECT_HEADERS
)

# source files
set(PROJECT_SOURCES
    SectorConsole.cpp
)

# forme files
set(PROJECT_UI
)

# ressources
set(PROJECT_RSC
)

# Use a library name as a dependency. 
# The "::" in the name forces CMake to look
# for a target instead of looking for bare 
# library files on the filesystem, which can 
# avoid some errors.
# Since CMake knows the include paths and 
# the libraries produced by the target, 
# it will add them automatically to the 
# compiler and linker command lines.
set(PROJECT_DEPS 
    ${CMAKE_ROOT_NAME}::Core
)

# bundle all together
set(PROJECT_FILES 
    ${PROJECT_HEADERS} 
    ${PROJECT_SOURCES} 
    ${PROJECT_UI} 
    ${PROJECT_RSC}
)

# Platform dependant stuff
# Windows (for both x86/x64)
if(WIN32 AND IS_UI)
    set(PROJECT_BUILD_ARGS WIN32)
else()
    set(PROJECT_BUILD_ARGS "")
endif()
# MacOS (for both x86/x64)
if(UNIX AND APPLE)   
    set(PROJECT_BUILD_ARGS "")
endif()
# Linux, BSD, Solaris, Minix (for both x86/x64)
if(UNIX AND NOT APPLE)   
    set(PROJECT_BUILD_ARGS "")
endif()

if(BUILD_THIS_EXEC)
    # build the executable
    add_executable( 
        ${EXECUTABLE_NAME}       
        ${PROJECT_BUILD_ARGS}                   
        ${PROJECT_FILES}
    )
    # link the executable
    if(PROJECT_DEPS AND 
        NOT PROJECT_DEPS STREQUAL "")
            target_link_libraries(${EXECUTABLE_NAME} ${PROJECT_DEPS})
    else()
        message(" >>> ${EXECUTABLE_NAME} has no dependencies")
    endif()
endif()