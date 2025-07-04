generic procedures are defined with the keyword procedure and the generic name, followed by a
parenthesized list of specific procedures that can be invoked by that name. The
compiler chooses the correct procedure at compile time based on the type of the
argument passed to the generic procedure.

You can also define generic interfaces, which are similar to generic procedures
but provide a blueprint for procedures and allow you to declare specific procedures that conform to the interface. 

This way, you can ensure that the specific
procedures have a specific signature and provide a level of abstraction.
You can use type-bound procedures to extend the functionality of derived
types. Type-bound procedures are procedures that are associated with a specific
derived type and can be called using the syntax object % procedure_name.
This makes it easy to extend the functionality of existing types and write clean,
modular code.


When you write a generic procedure, you define a generic name and specify
the type of the arguments it will accept. You can then write specific procedures
with the same name that operate on different data types. The correct procedure
to call will be determined based on the type of arguments passed in. This can lead
to more readable and maintainable code, as the same interface can be used for
multiple data types, and you can write more specialized code for each data type.

You can also provide custom operators for different derived types. These operators
can be overloaded to work on specific types and allow you to write more natural-
looking and readable code.

While generic procedures and custom operators can make your code more readable
and maintainable, they also add another layer of abstraction, making the code
more complex. It's important to weigh the benefits against the added complexity
before using these features, and to use them only when they clearly make your
code simpler.