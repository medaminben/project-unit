
// Include local private headers using quotes and path relative to the
// current file
#include "Core_impl.h"

// Include public headers of the current or other target within this
// project with path relative to the "include" directory
#include <Sector/Core/Core.h>
// #include <myproject/xyz/header.h>

// Include 3rd party headers with brackets
// #include <xyz>

// Include standard headers with brackets
#include <iostream>


namespace Sector {

    namespace Core {
        unsigned int get_the_answer(void) {
            return 42; 
        }

        int multiply(int lhs, int rhs) {
            return lhs * rhs; 
        }
    }
} 
