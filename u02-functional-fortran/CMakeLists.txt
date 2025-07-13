cmake_minimum_required(VERSION 3.10 FATAL_ERROR)
project(functional-fortran LANGUAGES Fortran)

# ------------------------------------------------------------------------------
# Output directories
# ------------------------------------------------------------------------------

set(CMAKE_Fortran_MODULE_DIRECTORY ${PROJECT_BINARY_DIR}/include)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)

# ------------------------------------------------------------------------------
# Default to Release build if unspecified
# ------------------------------------------------------------------------------

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

# ------------------------------------------------------------------------------
# Compiler flags
# ------------------------------------------------------------------------------

if(CMAKE_Fortran_COMPILER_ID MATCHES GNU)
  set(CMAKE_Fortran_FLAGS_DEBUG   "-O0 -g -fbacktrace -Wall -Wextra -fcheck=all")
  set(CMAKE_Fortran_FLAGS_RELEASE "-O3 -ffree-line-length-none")
endif()

if(CMAKE_Fortran_COMPILER_ID MATCHES Intel)
  set(CMAKE_Fortran_FLAGS         "${CMAKE_Fortran_FLAGS} -assume realloc_lhs -heap-arrays")
  set(CMAKE_Fortran_FLAGS_DEBUG   "-O0 -g -C -traceback")
  set(CMAKE_Fortran_FLAGS_RELEASE "-O3")
endif()

if(CMAKE_Fortran_COMPILER_ID MATCHES Cray)
  set(CMAKE_Fortran_FLAGS         "${CMAKE_Fortran_FLAGS} -h noomp")
  set(CMAKE_Fortran_FLAGS_DEBUG   "-O0 -g")
  set(CMAKE_Fortran_FLAGS_RELEASE "-O3")
endif()

# ------------------------------------------------------------------------------
# Source Collection
# ------------------------------------------------------------------------------

file(GLOB_RECURSE FUNCTIONAL_SOURCES
    "${CMAKE_SOURCE_DIR}/src/*.f90"
)

file(GLOB_RECURSE TEST_SOURCES
    "${CMAKE_SOURCE_DIR}/test/test_*.f90"
)

# ------------------------------------------------------------------------------
# Libraries
# ------------------------------------------------------------------------------

add_library(functional ${FUNCTIONAL_SOURCES})
add_library(testing test/testing.f90)

# ------------------------------------------------------------------------------
# Test Executables and Registration
# ------------------------------------------------------------------------------

enable_testing()

foreach(TEST_FILE IN LISTS TEST_SOURCES)
  get_filename_component(TEST_NAME ${TEST_FILE} NAME_WE)         # test_head
  string(REPLACE "test_" "" EXEC_ID ${TEST_NAME})                # head

  add_executable(${TEST_NAME} ${TEST_FILE})
  target_link_libraries(${TEST_NAME} functional testing)
  add_test(NAME ${TEST_NAME} COMMAND ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${TEST_NAME})
endforeach()

# ------------------------------------------------------------------------------
# Installation
# ------------------------------------------------------------------------------

install(DIRECTORY ${CMAKE_Fortran_MODULE_DIRECTORY} DESTINATION ${CMAKE_INSTALL_PREFIX}/include)
install(DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY} DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
