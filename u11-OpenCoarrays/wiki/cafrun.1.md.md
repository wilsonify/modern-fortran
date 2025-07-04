CAFRUN 1 2017-09-12 OpenCoarrays-1.9.1 "cafrun coarray Fortran job launcher manual"
===================================================================================

NAME
----

`cafrun` - Coarray Fortran executable launcher for OpenCoarrays

SYNOPSIS
--------

`cafrun` [`-s`] `-np` \<N\> *\</path/to/coarray-executable\>* [arg1 [arg2 ...]]

DESCRIPTION
-----------

`cafrun` is wrapper script which will launch Coarray Fortran
executables across \<N\> images using the appropriate parallel
runtime that OpenCoarrays was compiled against, (e.g.,
mpiexec(1)). `cafrun` ensures the correct flags are passed to the
parallel runtime job launcher, as determined by system introspection
at OpenCoarrays build time. Advanced users may compile their Coarray
Fortran code however they please, but we recommend using the caf(1)
compiler wrapper script for a more user friendly experience.

To see the default command run by `cafrun`, add the `-s` or `--show`
flags. To see how a specific command would be executed, simply
construct the command you plan to use to launch your job, and add
`-s` or `--show` as the very first flag after `cafrun`, e.g.,
`cafrun -s ...` to see how `cafrun` is translating your invocation for
the parallel runtime job launcher (e.g., mpiexec(1)).

OPTIONS
-------

`--help`, `-h`
  Print a brief help/usage message and return without
  performing any substantive action.

`-np` \<N\>
  Mandatory flag with argument to specify the number of Coarray
  Fortran images to be spawned. \<N\> must be a positive integer.

`--reenable-auto-cleanup`
  If OpenCoarrays is built supporting failed images, which requires
  GFortran >= 7.0 and an MPI implementation with user level failure
  mitigation support (ULFM) and NOT disabling it at build time, then
  `cafrun` turns OFF mpi auto cleanup, and handles cleanup in the
  OpenCoarrays library. This is required to properly support failed
  images. `--reenable-auto-cleanup` re-enables the parallel runtime's
  auto cleanup features which breaks the failed images functionality
  but provides more robust error detection and application
  aborting. If failed images support was not enabled at OpenCoarrays
  build time, then this flag is a noop.

`--show`, `-s`
  Print the default invocation of the underlying parallel
  runtime's job launcher (e.g., `mpiexec`), including what flags are
  passed, etc. This also functions as a dry-run for executing a
  specific `cafrun` command, showing the user how the compiler would
  be called with the additional files and arguments passed by the
  user.

`--version`, `-V`, `-v`
  Print OpenCoarrays version and copyright information and exit.

`--wrapping`, `--wraps`, `-w`
  Report the version of the parallel runtime `cafrun` is wrapping and exit.

BUGS
----

For a list of bugs currently affecting OpenCoarrays, or to report a new one, please report any bugs to the OpenCoarrays project at https://github.com/sourceryinstitute/OpenCoarrays/issues

AUTHOR
------

Izaak Beekman <izaak@izaakbeekman.com>

SEE ALSO
--------

caf(1), mpiexec(1), gfortran(1), [OpenCoarrays project page], [OpenCoarrays website](http://www.opencoarrays.org)

[OpenCoarrays project page]: https://github.com/sourceryinstitute/OpenCoarrays#readme
