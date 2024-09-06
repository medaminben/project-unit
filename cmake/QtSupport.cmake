
find_package(QT NAMES Qt6 Qt5 COMPONENTS Widgets Gui Core QUIET)
find_package(Qt${QT_VERSION_MAJOR}  COMPONENTS Widgets Gui Core QUIET)
set(qt_FOUND ${QT6_FOUND} OR ${QT5_FOUND})

if( NOT qt_FOUND)

    # Set Ninja for compilation
    set( CMAKE_GENERATOR "Ninja" CACHE STRING "CMake generator" FORCE )

    # Initial message
    message( STATUS "Qt 6.7.0 not found. Downloading and configuring Qt..." )

    # Download and extract archive of Qt 6.7.0
    set( QT_VERSION "6.7.0" )
    set( QT_ARCHIVE_URL "https://download.qt.io/official_releases/qt/6.7/${QT_VERSION}/submodules/qtbase-everywhere-src-${QT_VERSION}.tar.xz" )
    set( QT_ARCHIVE_FILE "${CMAKE_CURRENT_BINARY_DIR}/3rdParty/QT/qtbase-everywhere-src-${QT_VERSION}.tar.xz" )
    set( QT_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/3rdParty/QT/qtbase-everywhere-src-${QT_VERSION}" )
    message( STATUS "Downloading the package from the official repository..." )
    file( DOWNLOAD ${QT_ARCHIVE_URL} ${QT_ARCHIVE_FILE})
    message( STATUS "Unpacking the release..." )
    execute_process( COMMAND ${CMAKE_COMMAND} -E tar xvf ${QT_ARCHIVE_FILE}
                     WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR} 
                     OUTPUT_QUIET
    )

    # Configure Qt (skip building of useless modules)
    set( QT_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}/3rdParty/QT/build" )
    file( MAKE_DIRECTORY ${QT_BUILD_DIR} )
    message( STATUS "Configuring..." )
    execute_process( COMMAND ${QT_SOURCE_DIR}/configure -prefix ${QT_BUILD_DIR}
                     WORKING_DIRECTORY ${QT_BUILD_DIR} )

    # Check if system supports parallelization
    if( DEFINED ENV{NUMBER_OF_PROCESSORS} )
        set( JOBS_OPTION "-j$ENV{NUMBER_OF_PROCESSORS}" )
    elseif( DEFINED ENV{PROCESSOR_COUNT} )
        set( JOBS_OPTION "-j$ENV{PROCESSOR_COUNT}" )
    else()
        set( JOBS_OPTION "" )
    endif()

    # Use -j option to compile if possible (qt is very big)
    if( JOBS_OPTION )
        message( STATUS "Compiling with parallelization..." )
        execute_process( COMMAND ninja ${JOBS_OPTION}
                     WORKING_DIRECTORY ${QT_BUILD_DIR} )
    else()
        message( STATUS "Compiling without parallelization..." )
        execute_process( COMMAND ninja
                     WORKING_DIRECTORY ${QT_BUILD_DIR} )
    endif()

    # Set necessary environment variables to use Qt
    set( ENV{QTDIR} ${QT_BUILD_DIR} )
    set( ENV{PATH} ${QT_BUILD_DIR}/bin:$ENV{PATH})

else()
    message( STATUS "Qt 6.7.0 found in the system." )
endif()

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)