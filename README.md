# project-unit
 Boilerplate for CMake and C++

This repository is a CMake boilerplate for starting a C++ project.
The architecture of the project is library based structure
The Lib architecture gives a higher degree of freedom by splitting the producers (in this example case, the core library) and the consumer (as the console app).
Following this strategy, the development is better organized, productive and agile.
For better understanding of the different cmake skript please take a look at [Professional CMake: A Practical Guide](https://crascit.com/professional-cmake/), 
## External dependencies
### A C++ compiler
Recent version of [Visual Studio](https://www.visualstudio.com/), and [GCC](https://gcc.gnu.org/) should be fine.
The default setting uses std 20, but you can change it in [common.cmake](https://github.com/medaminben/project-unit/blob/main/cmake/Common.cmake).
### CMake 3.29
- CMake is the build tool used for this project.

### Generator
- (Optional) [Ninja](https://ninja-build.org/) can greatly improve the incremental build time.

### 3rdParty
- [googletest](https://github.com/google/googletest.git)
- [QT Framework](https://www.qt.io/) no automated installation, you have to accept the license first and install it by yourself, and then set the path for QT6_DIR in [BuildLocation.cmake](https://github.com/medaminben/project-unit/blob/main/cmake/BuildLocation.cmake) to the right location to let cmake finding it.

## Usage
Before starting your project, modify all project names in the CMake files into your needs. And be careful of the folder and file names. You need to modify those names in both the CMake files and the project structure. 
For a quick start, is advised to use the library generator. Which uses a configuration template. 
Actually as example the apps pre implemented consume the result of the Core library.Which itself is completely generated.  

## Motivation 
- The code base is avoiding overwhelming the developer by presenting very clear and self describing interfaces, which allow an easy project management; And reduce the occurrence of errors 
- The structure can be used as a base for different types and flavours of end products like SDKs, applications, services etc...
## Barriers
- For sure the shortness of the different scripts gives an ease in the build management, but the complexity of folder/files structure is a little bit confusing especially by browsing

## CMake Options
- BUILD_SHARED_LIBS : Build project libraries as shared libraries  
- BUILD_APPS : Build applications
- BUILD_QT_UI : Build Qt based applications
- BUILD_VERBOSE_OUTPUT : Build with verbose output  
- BUILD_TESTING : Build tests

## License
This repository is released under Public Domain, use it in whatever way you want. See the [License file](https://github.com/medaminben/project-unit/blob/main/LICENSE) for more information.
