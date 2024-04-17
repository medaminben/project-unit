
project(SectorQt_UI VERSION 1.0.1 LANGUAGES CXX)

# Don't use PROJECT_NAME as target name, 
# using a proper executable name gives 
# more freedom 
set(EXECUTABLE_NAME SectorQt_UI)

# will be used to check building it or not
# will be needed in case of missing 3rdparty 
# dependencies to reject the build (example of 
# usage: an app depends on boost and boost is 
# not available also better to  discard 
# building here)
set(BUILD_THIS_EXEC ${BUILD_QT_UI})
# Manage executable files
# header files
set(PROJECT_HEADERS
    mainwindow.h    
)

# source files
set(PROJECT_SOURCES
    SectorQt_UI.cpp
    mainwindow.cpp
)

# forme files
set(PROJECT_UI
    mainwindow.ui
)

# ressources
set(PROJECT_RSC
)

# Use a library name as a dependency. 
# The "::" in the name forces CMake to look
# for a target instead of looking for bare 
# library files on the filesystem, which can 
# avoid some errors. Since CMake knows  the 
# include paths and  the libraries  produced 
# by the target, it will add them  automatically 
# to the compiler and linker command lines.
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
if(BUILD_THIS_EXEC)
    qt_add_executable(${EXECUTABLE_NAME} 
        MANUAL_FINALIZATION 
        ${PROJECT_FILES}
    )
    target_link_libraries(${EXECUTABLE_NAME} 
        PRIVATE 
        Qt${QT_VERSION_MAJOR}::Widgets
        Qt${QT_VERSION_MAJOR}::Gui 
        Qt${QT_VERSION_MAJOR}::Core
        ${PROJECT_DEPS}
    )
    set_target_properties(${EXECUTABLE_NAME} 
        PROPERTIES 
        WIN32_EXECUTABLE TRUE
        MACOSX_BUNDLE    TRUE
    )
endif()


