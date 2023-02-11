
Procedures in Fortran, 
such as functions and subroutines, 
allow you to organize your code into self-contained units of functionality that can be reused wherever they are needed.

Functions are invoked from expressions and return only one value as a result, 
making them best suited for small bits of calculation that don't cause any side effects. 

On the other hand, 
subroutines are invoked using a call statement and can return any number of arguments as a result, 
making them appropriate for operations that cause side effects, 
such as modifying variables in-place and performing I/O operations.

You can define functions or subroutines as pure to prevent side effects, 
which generally leads to code that is easier to understand, debug, and optimize. 

Additionally, 
defining functions or subroutines as elemental allows them to operate on both scalars and arrays of any rank and size.

It's important to design functions and subroutines carefully 
and to use them only if they make your program easier to read and understand, 
as they provide the first layer of abstraction in your code.