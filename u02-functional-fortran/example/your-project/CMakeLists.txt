cmake_minimum_required(VERSION 3.10)
project(your_project LANGUAGES Fortran)

# Set Fortran module output directory
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/mod)

# Specify source files
set(SRC_FILES src/main.f90)

# Add executable target
add_executable(map_squares ${SRC_FILES})

# Include path for module files
target_include_directories(map_squares PRIVATE
    ${CMAKE_SOURCE_DIR}/external/functional-fortran/include
)

# Link the external functional library (shared library)
target_link_libraries(map_squares PRIVATE
    ${CMAKE_SOURCE_DIR}/external/functional-fortran/lib/libfunctional.so
)

# Set runtime path so executable finds shared library at runtime
set_target_properties(map_squares PROPERTIES
    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_RPATH "$ORIGIN/../external/functional-fortran/lib"
)

# enable testing and add a test
enable_testing()
add_test(NAME test_map_square COMMAND test_map_square)

# Post-build step: copy executable to dist directory
add_custom_command(TARGET map_squares POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_SOURCE_DIR}/dist
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:map_squares> ${CMAKE_SOURCE_DIR}/dist/
)
