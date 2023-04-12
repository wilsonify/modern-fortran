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

include(FetchContent)

include(cmake/options.cmake)
include(cmake/compilers.cmake)

include(cmake/functional.cmake)
include(cmake/h5fortran.cmake)
include(cmake/json.cmake)

# library to archive (libneural.a)
FILE(GLOB NF_SRCS *.f90 nf/*.f90 np/io/*.f90)
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

