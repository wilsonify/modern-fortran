ver_file = echo "1.0.0" > $(1) && date +%Y-%m-%d >> $(1)
all: clean build/neural-fortran.txt

clean:
	rm -rf build
	rm -rf dist	

build/VERSION.txt:
	mkdir -p build && $(call ver_file, $@)

dist/VERSION.txt:
	mkdir -p dist && $(call ver_file, $@)

build/neural-fortran-base.txt: build/VERSION.txt
	docker build -f Dockerfile-base -t neural-fortran-base:latest . && $(call ver_file, $@)

build/neural-fortran-builder.txt:  build/neural-fortran-base.txt
	docker build -f Dockerfile-builder -t neural-fortran-builder:latest . && $(call ver_file, $@)

build/neural-fortran.txt: build/neural-fortran-builder.txt
	docker build -t neural-fortran:latest . && $(call ver_file, $@)

