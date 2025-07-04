
project('fortran_example', 'fortran', default_options: ['buildtype=debug'])

src = 'src'

# List of modules
mymath = files(join_paths(src, 'mymath.f90'))
userfunc = files(join_paths(src, 'user_functions.f90'))

# Programs
executable('e01-hello', join_paths(src, 'e01-hello.f90'))
executable('e02-tabulate', [userfunc, join_paths(src, 'e02-tabulate.f90')])
executable('e03-runtime_libs', join_paths(src, 'e03-runtime_libs.f90'))
executable('e04-static-link', [mymath, join_paths(src, 'e04-static-link.f90')])
executable('e05-dynamic-link', [mymath, join_paths(src, 'e05-dynamic-link.f90')])
