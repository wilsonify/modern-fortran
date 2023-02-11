# This is a Makefile,
# a script that automates the process of building and compiling software.
# It is commonly used to build large software projects.
# The Makefile specifies the dependencies between the various files and targets and the rules for building them.
# When you run make, it will read the Makefile and determine what needs to be built and in what order,
# based on the specified dependencies.

# Here are the key elements of this Makefile:
	# FC is a variable that stores the name of the Fortran compiler to use, which is gfortran in this case.
	# FCFLAGS is a variable that stores flags to pass to the compiler, which is -O3 in this case.
	# -O3 is an optimization flag that asks the compiler to optimize the code for speed.
	# OBJS is a variable that stores a list of object files (.o files), which are the output files of the compilation process.
	# .PHONY is a special construct to specify certain targets are not files
	# .SUFFIXES is a special construct to specify file types.
	# The .f90.o rule specifies how to compile a Fortran source file (.f90) into an object file (.o).
	# The $< symbol represents the name of the source file
	# the $@ symbol represents the name of the target file
	# The %.o: %.mod line is a pattern rule that specifies how to create an object file from a module file (.mod).
	# The all target specifies the targets that should be built when you run the Makefile.

# Define the Fortran compiler to use
FC = gfortran

# Define the flags to pass to the compiler
FCFLAGS = -O3

# List the object files needed to build the binary
OBJS = mod_diff.o mod_initial.o

# Specify targets that are not real files
.PHONY: all clean

# Specify the suffixes for file types
.SUFFIXES: .f90 .o

# Compile a Fortran source file into an object file
.f90.o:
	# Compile the source file using the specified compiler and flags
	$(FC) -c $(FCFLAGS) $<

# Create an object file from a module file
%.o: %.mod

# Entry point to build all targets
all: tsunami tsunami-data.txt water_height_0010.svg water_height_0050.svg

# Build the binary file
tsunami: tsunami.f90 $(OBJS)
	# Compile the source file and object files into a binary file
	$(FC) $(FCFLAGS) $< $(OBJS) -o $@

tsunami-data.txt: tsunami
	./tsunami >$@

water_height_0010.svg: tsunami-data.txt
	python plot_water_height.py tsunami-data.txt 10

water_height_0050.svg: tsunami-data.txt
	python plot_water_height.py tsunami-data.txt 50

clean:
	$(RM) tsunami
	$(RM) *.o
	$(RM) *.mod
	$(RM) *.txt
	$(RM) *.svg
