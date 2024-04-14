//Include Project headrs
#include <Sector/Core/Core.h>


// Include 3rdparty headers

// Include std headers
#include <iostream>
#include <string>

using namespace Sector;

int main(void )
{
    std::cout << "Execution of Core Library" << std::endl;
    std::cout <<  std::to_string(Core::multiply(6,6)) << std::endl;
    std::cout << "The answer is " << Core::get_the_answer() << std::endl;
    std::cout << std::endl;
    return 0;
}