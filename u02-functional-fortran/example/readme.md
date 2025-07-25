How to Use libfunctional.so in Your Fortran Project
===


1. What You Need from Us

    The shared library file: libfunctional.so (on Linux/macOS; on Windows it would be functional.dll)

    The module files (*.mod) located in the include/ directory next to the library

2. Setting Up Your Project

Assuming you have these files organized like this:
```
your-project/
├── main.f90
├── libfunctional.so         # The shared library
└── include/
    └── functional.mod      # Module files required for compilation
```

3. Compiling Your Code

When compiling your Fortran code that uses the functional module:

    Add the module path so the compiler can find the .mod files.

    Tell the linker where to find the shared library.

    Link against the functional shared library.

Example compilation command with gfortran:

    -I./include — look for module files in ./include

    -L. — look for libraries in the current directory (where libfunctional.so is)

    -lfunctional — link with libfunctional.so (the lib prefix and .so suffix are implicit)

    -o your_program — name the output executable

```
gfortran -I./include -L. -lfunctional -o your_program main.f90
```

4. Running Your Program

To run your program successfully, your system must be able to find libfunctional.so at runtime.

On Linux/macOS, set the LD_LIBRARY_PATH (or DYLD_LIBRARY_PATH on macOS) environment variable to include the directory containing libfunctional.so:

```
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)
./your_program

```