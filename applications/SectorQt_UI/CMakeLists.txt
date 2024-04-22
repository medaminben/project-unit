project(SectorQt_UI VERSION 1.1.1 LANGUAGES CXX)

# Don't use PROJECT_NAME as target name, 
# using a proper executable name gives 
# more freedom 
set(EXECUTABLE_NAME SectorQt_UI)
add_project(${EXECUTABLE_NAME} PROJECT_LIST)
# will be used to check building it or not
# will be needed in case of missing 3rdparty 
# dependencies to reject the build (example of 
# usage: an app depends on boost and boost is 
# not available also better to  discard 
# building here)
set(BUILD_${EXECUTABLE_NAME} ${BUILD_QT_UI} AND ${BUILD_APPS})
#executable type
set(${EXECUTABLE_NAME}_ENTRY "QT_ui")
# Manage executable files
# header files
set(${EXECUTABLE_NAME}_HEADERS
    mainwindow.h      
)

# source files
set(${EXECUTABLE_NAME}_SOURCES
    SectorQt_UI.cpp
    mainwindow.cpp
)

# forme files
set(${EXECUTABLE_NAME}_UI
    mainwindow.ui
)
# ressources
set(${EXECUTABLE_NAME}_RSC
)

# Use a library name as a dependency. 
# The "::" in the name forces CMake to look
# for a target instead of looking for bare 
# library files on the filesystem, which can 
# avoid some errors. Since CMake knows  the 
# include paths and  the libraries  produced 
# by the target, it will add them  automatically 
# to the compiler and linker command lines.
set(${EXECUTABLE_NAME}_DEPS 
    ${CMAKE_ROOT_NAME}::Core
    Qt${QT_VERSION_MAJOR}::Widgets
    Qt${QT_VERSION_MAJOR}::Gui 
    Qt${QT_VERSION_MAJOR}::Core
)

set(${EXECUTABLE_NAME}_BUILD_ARGS 
    MANUAL_FINALIZATION
)

#################################################
# Build all the projects
#################################################

foreach(item IN LISTS PROJECT_LIST)

    if(BUILD_${item})
        # create_application(
        #     NAME  "PROJECT_x_NAME"
        #     ENTRY ["Console" "QT_ui" "WX_ui" "Service"]
        #     HEADERS "<header.h ...>""
        #     SOURCES ">source.cpp ...>"
        #     RESOURCES "<file.txt ...>"
        #     UI "form.ui"     
        #     BUILD_ARGS "<WIN32 ...>"
        #     DEPENDENCIES "internal::dependencies" "third_party::dependencies"
        # )
        create_application(
            NAME         ${item}
            ENTRY        ${${item}_ENTRY}
            HEADERS      ${${item}_HEADERS} 
            SOURCES      ${${item}_SOURCES} 
            RESOURCES    ${${item}_RSC}
            UI           ${${item}_UI}     
            BUILD_ARGS   ${${item}_BUILD_ARGS}
            DEPENDENCIES ${${item}_DEPS}       
        )
    endif()

endforeach()