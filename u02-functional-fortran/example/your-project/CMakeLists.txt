cmake_minimum_required(VERSION 3.10)
project(your_project LANGUAGES Fortran)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/mod)

# === Main Executable ===
set(SRC_FILES src/main.f90)
add_executable(map_squares ${SRC_FILES})

target_include_directories(map_squares PRIVATE
    ${CMAKE_SOURCE_DIR}/external/functional-fortran/include
)

target_link_libraries(map_squares PRIVATE
    ${CMAKE_SOURCE_DIR}/external/functional-fortran/lib/libfunctional.so
)

set_target_properties(map_squares PROPERTIES
    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_RPATH "$ORIGIN/../external/functional-fortran/lib"
)

# === Test Executable ===
enable_testing()

add_executable(test_map_square test/test_main.f90)

target_include_directories(test_map_square PRIVATE
    ${CMAKE_SOURCE_DIR}/external/functional-fortran/include
)

target_link_libraries(test_map_square PRIVATE
    ${CMAKE_SOURCE_DIR}/external/functional-fortran/lib/libfunctional.so
)

set_target_properties(test_map_square PROPERTIES
    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_RPATH "$ORIGIN/../external/functional-fortran/lib"
)

add_test(NAME test_map_square COMMAND test_map_square)

# === Post-build Copy ===
add_custom_command(TARGET map_squares POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_SOURCE_DIR}/dist
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:map_squares> ${CMAKE_SOURCE_DIR}/dist/
)
