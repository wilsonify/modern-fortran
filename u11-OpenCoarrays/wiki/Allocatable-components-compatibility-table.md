coarray kind | example | gfortran support | ocaf support
----------------|-------------|----------------------|------------------
global saved coarrays of intrinsic types | float, saved :: caf[*] | yes | yes
global allocatable coarrays of intrinsic types | float, allocatable :: caf[*] | yes | yes
coarrays of derived type w/o allocatable components | type(T), saved :: tcaf[*] ; type(T), allocatable :: t2caf[*] | yes | yes
coarrays *in* derived types (saved and allocatable) | type T ; float :: caf[*] ; end type T | yes | yes
allocatable components in derived type coarrays | type T ; float, allocatable :: acc ; end type T ; type(T), saved :: caf[*] | yes | wip *)
coarray get where the target needs to be implicitly allocated | float, allocatable :: target ; float, saved :: caf[*] ; target = caf[1] | yes | wip *)
coarray put or getput where the target needs to be implicitly allocated | float, allocatable :: source ; float, saved :: caf[*] ; caf[1] = source | yes | no

[Wiki home]

[wiki home]: https://github.com/sourceryinstitute/OpenCoarrays/wiki