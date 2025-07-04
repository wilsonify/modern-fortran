In addition to modules, Fortran also has the concept of submodules. 

Submodules are similar to modules, but they allow you to define entities within the scope of a parent module. 

This makes submodules useful for organizing the contents of a module into more manageable pieces.

Submodules are defined within a module, and they can access all public entities of their parent module. 

However, entities in a submodule are private by default, and they can only be accessed within the submodule itself, 
or through a parent module that has access to the submodule.

To access a submodule, you use the module procedure with the submodule name, 
and then use the use statement to import its entities into the current scope. 

Like with modules, you can also use the "use" statement with "only: …" to import specific entities from a submodule.

The use of modules and submodules can help make your code more modular, organized, and easier to maintain.