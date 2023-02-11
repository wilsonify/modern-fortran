# Define the Fortran compiler to use
FC = caf

# Define the flags to pass to the compiler
FCFLAGS = -O3

# List the object files needed to build the binary
OBJS = mod_diff.o mod_field.o mod_io.o mod_parallel.o

# Specify targets that are not real files
.PHONY: all clean

# Specify the suffixes for file types
.SUFFIXES: .f90 .o

# Compile a Fortran source file into an object file using the specified compiler and flags
.f90.o:
	$(FC) -c $(FCFLAGS) $<

# Create an object file from a module file
%.o: %.mod

all: tsunami

tsunami: tsunami.f90 $(OBJS)
	$(FC) $(FCFLAGS) $< $(OBJS) -o $@


mod_field.o: mod_field.f90 mod_diff.o mod_io.o mod_parallel.o

clean:
	$(RM) tsunami *.o *.mod
