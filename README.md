# project-unit
 Crossplatform  boilerplate for CMake and C++

This repository is a CMake boilerplate for starting cross-platform C++ projects.
THe architechture of the project is library based structure
The Lib architechture gives a higher degree of freedom by splitting the producers (in our example case, the core library) and the consumer (as the sector console app).
Following this strategy, the developement is more productive and agile. 

## External dependencies
### A C++ compiler
Recent version of [Visual Studio](https://www.visualstudio.com/), and [GCC](https://gcc.gnu.org/) should be find.
The default setting uses std 17, but you can change it in `cmake/common.cmake`.
### CMake 3.29
- CMake is the build tool used for this project.

### Generator
- (Optional) [Ninja](https://ninja-build.org/) can greatly improve the incremental build time.

### 3rdParty
- none yet

## Usage
Before starting your project, modify all project names in the CMake files into your needs. And be carefull of the folder and file names 
You need to modify those names in both the CMake files and the project structures.

## Motivation 
- The code base is avoiding overwhelming the developer by presenting very clear and self describing interfaces, whuch allows an easy project management; And reduces the occurence of errors 
- The structure can be used as a base for different type and flavour of endproducts like SDKs, apps, services ect...
## Barriers
- For sure the shortness of the different scripts gives an easiness in the build management, but the complexity of folder/files structure is a little bit confusing especially by browsing

## CMake Options
- BUILD_SHARED_LIBS       Build project libraries as shared libraries  
- BUILD_VERBOSE_OUTPUT    Build with verbose output  

## License
This repository is released under Public Domain, use it in whatever way you want. See [License](file:License) for more information.
