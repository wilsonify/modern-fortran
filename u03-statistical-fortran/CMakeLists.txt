cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
project(statistical-fortran LANGUAGES Fortran)

# ------------------------------------------------------------------------------
# Output and module paths
# ------------------------------------------------------------------------------
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/include)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# ------------------------------------------------------------------------------
# Default build type
# ------------------------------------------------------------------------------
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

# ------------------------------------------------------------------------------
# Compiler flags based on compiler ID
# ------------------------------------------------------------------------------
if(CMAKE_Fortran_COMPILER_ID MATCHES GNU)
  set(CMAKE_Fortran_FLAGS_DEBUG   "-O0 -g -fbacktrace -Wall -Wextra -fcheck=all")
  set(CMAKE_Fortran_FLAGS_RELEASE "-O3 -ffree-line-length-none")
elseif(CMAKE_Fortran_COMPILER_ID MATCHES Intel)
  set(CMAKE_Fortran_FLAGS         "${CMAKE_Fortran_FLAGS} -assume realloc_lhs -heap-arrays")
  set(CMAKE_Fortran_FLAGS_DEBUG   "-O0 -g -C -traceback")
  set(CMAKE_Fortran_FLAGS_RELEASE "-O3")
elseif(CMAKE_Fortran_COMPILER_ID MATCHES Cray)
  set(CMAKE_Fortran_FLAGS         "${CMAKE_Fortran_FLAGS} -h noomp")
  set(CMAKE_Fortran_FLAGS_DEBUG   "-O0 -g")
  set(CMAKE_Fortran_FLAGS_RELEASE "-O3")
endif()

# ------------------------------------------------------------------------------
# Collect all Fortran source files
# ------------------------------------------------------------------------------
file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS
    "${CMAKE_SOURCE_DIR}/src/*.f90"
)

file(GLOB_RECURSE TEST_FILES CONFIGURE_DEPENDS
    "${CMAKE_SOURCE_DIR}/test/**/*.f90"
)

# ------------------------------------------------------------------------------
# Build shared library from source files
# ------------------------------------------------------------------------------
add_library(statlib SHARED ${SRC_FILES})
target_include_directories(statlib PUBLIC ${CMAKE_Fortran_MODULE_DIRECTORY})

# ------------------------------------------------------------------------------
# Add testing support
# ------------------------------------------------------------------------------
enable_testing()

foreach(test_file IN LISTS TEST_FILES)
  get_filename_component(test_name ${test_file} NAME_WE)
  string(REPLACE "test-" "" exe_name ${test_name})

  add_executable(${exe_name} ${test_file})
  target_link_libraries(${exe_name} PRIVATE statlib)
  add_test(NAME ${exe_name} COMMAND ${exe_name})
endforeach()

# ------------------------------------------------------------------------------
# Install rules
# ------------------------------------------------------------------------------
install(TARGETS statlib
        LIBRARY DESTINATION ${CMAKE_SOURCE_DIR}/dist/lib
        ARCHIVE DESTINATION ${CMAKE_SOURCE_DIR}/dist/lib
        RUNTIME DESTINATION ${CMAKE_SOURCE_DIR}/dist/bin)

install(DIRECTORY ${CMAKE_Fortran_MODULE_DIRECTORY}/
        DESTINATION ${CMAKE_SOURCE_DIR}/dist/include)
