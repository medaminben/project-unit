# The project name is used internally by CMake, but is not relevant for
# for anything else. To avoid confusion, it should however match with the
# directory name. Camel case is okay.
project(Core)

# Clients of this library should use this name, it contains a double colon
# which tells CMake it's a target and allows for more specific error messages.
set(LIBRARY_NAME "${CMAKE_ROOT_NAME}::${PROJECT_NAME}")
# The internal, raw name is generated from LIBRARY_NAME
get_raw_target_name(${LIBRARY_NAME} LIBRARY_NAME_RAW)

# Manage executable files
set(PROJECT_HEADERS
    # private headers belong to "src"
    src/Core_impl.h
    # Public headers belong in: include/CMAKE_ROOT_NAME/...
    # Other components and applications will add "include" 
    # to their search path, and need to use  the following 
    # kind of path: #include <CMAKE_ROOT_NAME/PROJECT_NAME/...>
    include/Sector/Core/Core.h
    include/Sector/Core/Sector_export.h
)

set(PROJECT_SOURCES
    # Source files belong in "src", 
    # they will never been seen or used by other components, 
    src/Core.cpp
    src/Core_impl.cpp
)

set(PROJECT_RSC
    # resources 
)

set(PROJECT_TST
)

set(PROJECT_FILES 
    ${PROJECT_HEADERS} 
    ${PROJECT_SOURCES} 
    ${PROJECT_RSC}
)

add_definitions(-DMAKE_SECTOR)
add_library(${LIBRARY_NAME_RAW} 
            ${PROJECT_FILES}
)
#create a dummy library aliasing the raw name
add_library(${LIBRARY_NAME} 
            ALIAS 
            ${LIBRARY_NAME_RAW}
)
 
# This is used in build with MSVC an export flag must be set  
if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_compile_definitions(${LIBRARY_NAME_RAW} 
        PRIVATE 
        COMPILER_ID=1 #needed for export
    )
endif()

target_include_directories(${LIBRARY_NAME_RAW}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/>
        $<INSTALL_INTERFACE:include/>
)

target_link_libraries(${LIBRARY_NAME_RAW}
    PRIVATE
        # private dependencies here
    PUBLIC
        # public dependencies here
)