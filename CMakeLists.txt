cmake_minimum_required(VERSION 3.29)

# Project names are only relevant for humans, camel case is Oay
project(Sector VERSION 1.0.1)
# globalization of the root project name
set(CMAKE_ROOT_NAME ${PROJECT_NAME})

# In productive projects, often used shared libraries which shortens build time
# when building incrementally, since less files have to be rewritten when a
# library has to be rebuilt.
# This option is the standard option
option(BUILD_SHARED_LIBS       "Build project libraries as shared libraries" ON)
option(BUILD_VERBOSE_OUTPUT    "Build with verbose output" OFF)

# Let include() find modules with out an explicit directory
# and without a suffix:
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# include modules
include(Common)

# add libraries
add_subdirectory(libraries)
# add librariy consumers
add_subdirectory(applications)
