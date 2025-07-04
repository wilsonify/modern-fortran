cmake_minimum_required(VERSION 3.15)
project(fortran_example LANGUAGES Fortran)

# Shared modules
set(MODULE_SOURCES
    src/user_functions.f90
    src/mymath.f90
)

# Program targets
add_executable(e01-hello
    ${MODULE_SOURCES}
    src/e01-hello.f90
)

add_executable(e02-tabulate
    ${MODULE_SOURCES}
    src/e02-tabulate.f90
)

add_executable(e03-runtime_libs
    ${MODULE_SOURCES}
    src/e03-runtime_libs.f90
)

add_executable(e04-static-link
    ${MODULE_SOURCES}
    src/e04-static-link.f90
)

add_executable(e05-dynamic-link
    ${MODULE_SOURCES}
    src/e05-dynamic-link.f90
)
