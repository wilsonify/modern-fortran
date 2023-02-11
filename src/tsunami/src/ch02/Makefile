FC = gfortran
FCFLAGS = -O3

.PHONY: all clean

all: clean tsunami tsunami-data.txt water_height_ch02.svg

tsunami: tsunami.f90
	$(FC) $(FCFLAGS) $< -o $@

tsunami-data.txt: tsunami
	./tsunami > $@

water_height_ch02.svg: tsunami-data.txt
	which python
	python plot_height_multipanel.py tsunami-data.txt

clean:
	$(RM) tsunami
	$(RM) tsunami-data.txt
	$(RM) water_height_ch02.svg
