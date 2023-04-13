# CMake version, project name, language
cmake_minimum_required(VERSION 3.20)

# If build type not specified, default to release
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Default build Release")
endif()

project(neural-fortran
LANGUAGES C Fortran
)

enable_testing()
find_package(HDF5 REQUIRED COMPONENTS Fortran)

# Add git submodules
add_subdirectory(external/functional-fortran)
add_library(functional::functional ALIAS functional)

add_subdirectory(external/h5fortran)
add_library(h5fortran::h5fortran ALIAS h5fortran)
add_subdirectory(external/json-fortran)
add_library(jsonfortran::jsonfortran ALIAS jsonfortran)

# library to archive (libneural.a)
FILE(GLOB NF_SRCS *.f90 nf/*.f90 nf/io/*.f90)
add_library(neural
  ${NF_SRCS}
)

target_link_libraries(neural PRIVATE
  functional::functional
  h5fortran::h5fortran
  HDF5::HDF5
  jsonfortran::jsonfortran
)

install(TARGETS neural)

# Remove leading or trailing whitespace
string(REGEX REPLACE "^ | $" "" LIBS "${LIBS}")
