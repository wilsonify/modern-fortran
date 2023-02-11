# Define the Fortran compiler to use
FC = caf

# Define the flags to pass to the compiler
FCFLAGS = -O3

# List the object files needed to build the binary
OBJS = mod_diff.o mod_initial.o mod_parallel.o

# Specify targets that are not real files
.PHONY: all clean

# Specify the suffixes for file types
.SUFFIXES: .f90 .o

# Compile a Fortran source file into an object file using the specified compiler and flags
.f90.o:
	$(FC) -c $(FCFLAGS) $<

# Create an object file from a module file
%.o: %.mod

# Entry point to build all targets
all: clean tsunami tsunami-data.txt water_height_0010.svg water_height_0050.svg

# Build the binary file
tsunami: tsunami.f90 $(OBJS)
	$(FC) $(FCFLAGS) $< $(OBJS) -o $@

# run a simulation
tsunami-data.txt: tsunami
	./tsunami >$@

# plot the status at time=10
water_height_0010.svg: tsunami-data.txt
	python plot_water_height.py tsunami-data.txt 10

# plot the status at time=50
water_height_0050.svg: tsunami-data.txt
	python plot_water_height.py tsunami-data.txt 50

# Clean the project by removing generated files
clean:
	$(RM) tsunami *.o
	$(RM) *.mod
	$(RM) *.txt
	$(RM) *.svg

