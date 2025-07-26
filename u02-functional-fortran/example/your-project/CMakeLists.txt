cmake_minimum_required(VERSION 3.10)
project(map_squares LANGUAGES Fortran)

# Create output directories
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/mod)
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/mod)
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/external/include)
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/external/lib)

# === Copy Functional-Fortran Library and Headers ===
add_custom_target(copy_functional ALL
    COMMAND ${CMAKE_COMMAND} -E copy_directory
            ${CMAKE_SOURCE_DIR}/external/functional-fortran/include
            ${CMAKE_BINARY_DIR}/external/include
    COMMAND ${CMAKE_COMMAND} -E copy
            ${CMAKE_SOURCE_DIR}/external/functional-fortran/lib/libfunctional.so
            ${CMAKE_BINARY_DIR}/external/lib/
    COMMENT "Copying functional-fortran headers and library to build directory"
)

# === Main Executable ===
set(SRC_FILES ${CMAKE_SOURCE_DIR}/src/main.f90)

add_executable(map_squares ${SRC_FILES})
add_dependencies(map_squares copy_functional)

target_include_directories(map_squares PRIVATE
    ${CMAKE_BINARY_DIR}/external/include
)

target_link_libraries(map_squares PRIVATE
    ${CMAKE_BINARY_DIR}/external/lib/libfunctional.so
)

set_target_properties(map_squares PROPERTIES
    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_RPATH "$ORIGIN/external/lib"
)

# === Test Executable ===
enable_testing()

add_executable(test_map_square ${CMAKE_SOURCE_DIR}/test/test_main.f90)
add_dependencies(test_map_square copy_functional)

target_include_directories(test_map_square PRIVATE
    ${CMAKE_BINARY_DIR}/external/include
)

target_link_libraries(test_map_square PRIVATE
    ${CMAKE_BINARY_DIR}/external/lib/libfunctional.so
)

set_target_properties(test_map_square PROPERTIES
    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_RPATH "$ORIGIN/external/lib"
)

add_test(NAME test_map_square COMMAND test_map_square)

# === Post-build Distribution Copy ===
add_custom_command(TARGET map_squares POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_SOURCE_DIR}/dist
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:map_squares> ${CMAKE_SOURCE_DIR}/dist/
    COMMENT "Copying main executable to dist/"
)
