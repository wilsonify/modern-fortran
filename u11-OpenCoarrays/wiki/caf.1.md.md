CAF 1 2017-09-12 OpenCoarrays-1.9.1 "caf compiler wrapper manual"
=================================================================

NAME
----

`caf` - OpenCoarrays compiler wrapper to compile and link coarray Fortran source files and programs

SYNOPSIS
--------

`caf` [compiler-options] [linker-options] *\<fortran-source-file\>* [*object-files*] [libraries]

DESCRIPTION
-----------

`caf` is a compiler wrapper script which is generated when the [OpenCoarrays library][OpenCoarrays project page] that ensures coarray fortran programs are compiled with the same fortran compiler OpenCoarrays was built for, gfortran(1) by default, and that the linker links against the appropriate parallel runtime, MPI by default. The `caf` compiler wrapper serves a similar purpose to the MPI fortran wrapper compiler, mpifort(1). `caf` embeds the full path to the Fortran compiler it was built for, and to the parallel runtime libraries it links against, and a relative path, based on the install location of `caf` itself, to the OpenCoarrays library. This ensures that the API and ABI of OpenCoarrays is always consistent with the Fortran compiler it was built for, and the parallel runtime it uses. To upgrade the parallel runtime, e.g., MPI, or the Fortran compiler, you will need to rebuild and install OpenCoarrays, which will regenerate and reinstall the `caf` wrapper script.

`caf` tries to be smart about how it calls the underlying compiler and linker. Any user specified libraries will be inserted before the OpenCoarrays library, *libcaf_mpi*, and before the parallel runtime libraries. This ensures that the linker will be able to resolve any references to the OpenCoarrays library and the parallel runtime library made by user supplied libraries. In addition any options not recognized by `caf` itself, as outlined below in the OPTIONS section. To see the default command `caf` will invoke, run `caf --show`. To see how `caf` would execute a specific command, i.e., perform a dry-run, pass the full command you wish to run, with the additional `--show` option as the very first option or argument after `caf`. (e.g., `caf --show -c foo.f90 -o foo.f90.o` or `caf --show foo.f90.o bar.f90.o -lblas -o a.out`)

OPTIONS
-------

`--help`, `-h`
  Print a brief help/usage message and return without performing any substantive action.

`--show`, `-s`
  Print the default invocation of the underlying compiler, including what flags are passed, etc. This also functions as a dry-run for executing a specific command, showing the user how the compiler would be called with the additional files and arguments passed by the user.

`--version`, `-V`, `-v`
  Print OpenCoarrays version and copyright information and exit.

`--wrapping`, `--wraps`, `-w`
  Report the name and version of the Fortran compiler `caf` is wrapping and exit.

BUGS
----

For a list of bugs currently affecting OpenCoarrays, or to report a new one, please report any bugs to the OpenCoarrays project at https://github.com/sourceryinstitute/OpenCoarrays/issues

AUTHOR
------

Izaak Beekman <izaak@izaakbeekman.com>

SEE ALSO
--------

cafrun(1), gfortran(1), mpifort(1), [OpenCoarrays project page], [OpenCoarrays website](http://www.opencoarrays.org)

[OpenCoarrays project page]: https://github.com/sourceryinstitute/OpenCoarrays#readme
