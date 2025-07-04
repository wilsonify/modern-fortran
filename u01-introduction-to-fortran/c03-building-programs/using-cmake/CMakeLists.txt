cmake_minimum_required(VERSION 3.15)
project(fortran_example LANGUAGES Fortran)

add_executable(e02-tabulate
    src/user_functions.f90
    src/e02-tabulate.f90
)