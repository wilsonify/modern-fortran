Examples of collective subroutines include SUM, MINVAL, MAXVAL, and
REDUCE, which perform global reductions, such as computing a sum, a minimum,
a maximum, or an arbitrary operation, respectively, over all images in a team.

ALLREDUCE and ALLGATHER perform similar operations, but over all images
in a team, regardless of their team assignment.

Collective subroutines are useful when you want to perform a global operation
across all images in a program.

These new features are intended to help simplify parallel programming in Fortran
and make it easier to write and maintain high-performance parallel codes.


Collective subroutines are designed to handle common parallel reduction operations, 
such as summing, taking the minimum, or maximum of values across images.

They simplify the code and ensure that the collective operation is performed correctly
and efficiently without having to worry about communication between images.

Collectives can be used for a wide variety of tasks, such as reducing arrays, summing scalars, 
or even broadcasting values from one image to all other images.

Collectives can be called by any image and can be used in combination with teams 
and events to further simplify and optimize your parallel code.


It's important to note that collectives are performed on a team level, 
so all images in the same team must participate in the collective operation.

Also, collectives provide a higher-level abstraction than coarrays, and as such, 
their performance might not always be as efficient as manually performing the equivalent coarray operation.

However, collectives are useful for simplifying the code and reducing the risk of error, 
and it is recommended to use them whenever they fit the requirements of your parallel algorithm.
