Array slicing is a powerful feature of Fortran arrays. It allows you to reference
a contiguous section of an array using a specified range of indices.
You can slice arrays using the syntax array_name(start:stop:step). Start and
stop are the indices of the first and last elements to include, respectively, while
step determines the stride to take.
For example, if a is an array of 10 elements, a(2:7) would reference
the second to seventh elements of a, inclusive.
It’s also possible to slice arrays using negative indices to count from the end of
the array. For example, a(-3:-1) would reference the last three elements
of a.
In addition to slicing, you can reshape arrays into new shapes by assigning to
them with the reshape intrinsic function.
You can also use the transpose intrinsic function to transpose arrays, either by
specifying a transpose operator (/) after the array or by calling the transpose
function with the array as an argument.
Finally, you can use the reshape, transpose, and slicing features together to
manipulate arrays in powerful ways, making it possible to reshape arrays into
new shapes and transpose them into different orders, all in a single line of code.