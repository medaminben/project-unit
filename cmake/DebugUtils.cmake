# Dump all CMake variables to a text file for troubleshooting purposes
# The file is called CMakeVariablesDump.txt and it is located in the
# "CMakeFiles" directory corresponding to the binary directory which
# is active at the point where the function is called.
function(dump_cmake_vars)
    set(LOG_OUTPUT ${CMAKE_SOURCE_DIR}/build/output/${PROJECT_ARCH_TARGET}/${CMAKE_BUILD_TYPE}/log)
    set (args ${ARGN})

    # if optional args?
    list(LENGTH args args_count)
    if (${args_count} GREATER 0)
        list(GET args_count 0 arg)
        if("${arg}" MATCHES "\.txt$" OR "${arg}" MATCHES "\.log$")
            set(VARIABLESDUMP_FILE ${LOG_OUTPUT}/${arg})
        else()
            set(VARIABLESDUMP_FILE ${LOG_OUTPUT}/cmake_vars_dump.log)
        endif() 
    else()
        set(VARIABLESDUMP_FILE ${LOG_OUTPUT}/cmake_vars_dump.log)
    endif ()
    get_cmake_property(_variableNames VARIABLES)
    list(SORT _variableNames)
    list(REMOVE_DUPLICATES _variableNames) # variables appear twice when set from set_variables_from_env
    file(WRITE "${VARIABLESDUMP_FILE}" "") # Remove existing content
    foreach (_variableName ${_variableNames})
        file(APPEND "${VARIABLESDUMP_FILE}" "${_variableName}= ${${_variableName}}\n")
    endforeach()
    message(STATUS "Dumped all CMake variables to ${VARIABLESDUMP_FILE}")
endfunction()

# Print the name and the value of a variable 
# usefull for quick check
function(print)
    set (args ${ARGN})
    foreach(arg ${args})
        message(">>>>>> ${arg} = ${${arg}}")
    endforeach()
endfunction()

