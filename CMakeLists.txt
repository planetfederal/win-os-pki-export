cmake_minimum_required(VERSION 2.8.12)

set(VER_MAJOR "0")
set(VER_MINOR "1")
set(VER_PATCH "0")
set(CPACK_PACKAGE_VERSION_MAJOR ${VER_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${VER_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${VER_PATCH})

if(POLICY CMP0048) # in CMake >= 3.0.0
    cmake_policy(SET CMP0048 NEW) # allow project() to set VERSION variables
endif(POLICY CMP0048)
project(exportrsa VERSION ${VER_MAJOR}.${VER_MINOR}.${VER_PATCH})

add_subdirectory(exportrsa/exportrsa)
