FC = gfortran
FCFLAGS = -O3

.PHONY: all clean

all: clean tsunami tsunami-data.txt water_height_0010.svg water_height_0050.svg

tsunami: tsunami.f90
	$(FC) $(FCFLAGS) $< -o $@

tsunami-data.txt: tsunami
	./tsunami >$@

water_height_0010.svg: tsunami-data.txt
	python plot_water_height.py tsunami-data.txt 10

water_height_0050.svg: tsunami-data.txt
	python plot_water_height.py tsunami-data.txt 50

clean:
	$(RM) tsunami
	$(RM) tsunami-data.txt
	$(RM) water_height*.svg
