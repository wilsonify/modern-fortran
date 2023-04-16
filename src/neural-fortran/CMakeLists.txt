# CMake version, project name, language
cmake_minimum_required(VERSION 3.20)

# If build type not specified, default to release
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Default build Release")
endif()

project(neural-fortran LANGUAGES C Fortran )

enable_testing()
find_package(HDF5 REQUIRED COMPONENTS Fortran)
include(compilers.cmake)
include(options.cmake)

# install submodule
add_library(functional external/functional-fortran/src/functional.f90)
target_include_directories(functional PUBLIC $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/include> $<INSTALL_INTERFACE:include>)
add_library(functional::functional INTERFACE IMPORTED GLOBAL)
target_link_libraries(functional::functional INTERFACE functional)
install(TARGETS functional)

# install submodule
set(h5fortran_BUILD_TESTING false)
add_subdirectory(external/h5fortran)
file(MAKE_DIRECTORY ${h5fortran_BINARY_DIR}/include)
list(APPEND CMAKE_MODULE_PATH ${h5fortran_SOURCE_DIR}/cmake/Modules)

# install submodule
SET(JSON_REAL_KIND "REAL64")
SET(JSON_INT_KIND "INT32")
FILE(GLOB JF_LIB_SRCS external/json-fortran/src/*.F90 )
add_library(jsonfortran ${JF_LIB_SRCS})
target_compile_definitions(jsonfortran PRIVATE ${JSON_REAL_KIND} ${JSON_INT_KIND})
target_include_directories(jsonfortran PUBLIC $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/include> $<INSTALL_INTERFACE:include> )
add_library(jsonfortran::jsonfortran INTERFACE IMPORTED GLOBAL)
target_link_libraries(jsonfortran::jsonfortran INTERFACE jsonfortran)
install(TARGETS jsonfortran)

# library to archive (libneural.a)
FILE(GLOB NF_SRCS *.f90 nf/*.f90 nf/io/*.f90)
add_library(neural ${NF_SRCS})

target_link_libraries(neural PRIVATE
  functional::functional
  h5fortran::h5fortran
  HDF5::HDF5
  jsonfortran::jsonfortran
)

install(TARGETS neural)

# Remove leading or trailing whitespace
string(REGEX REPLACE "^ | $" "" LIBS "${LIBS}")
