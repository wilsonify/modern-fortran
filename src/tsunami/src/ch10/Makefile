FC = caf
FCFLAGS = -O3

OBJS = mod_diff.o mod_field.o mod_io.o mod_parallel.o

.PHONY: all clean
.SUFFIXES: .f90 .o

all: tsunami

tsunami: tsunami.f90 $(OBJS)
	$(FC) $(FCFLAGS) $< $(OBJS) -o $@

# run a simulation
tsunami_h_1000.dat: tsunami
	./tsunami

tsunami.gif: tsunami_h_1000.dat
	python plot_2d_water_elevation.py


.f90.o:
	$(FC) -c $(FCFLAGS) $<

%.o: %.mod

mod_field.o: mod_field.f90 mod_io.o mod_parallel.o

clean:
	$(RM) tsunami
	$(RM) *.o
	$(RM) *.mod
	$(RM) *.dat
	$(RM) *.png
	$(RM) *.gif