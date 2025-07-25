
dirs:
	mkdir -p build
	mkdir -p dist

all: build

build: dirs
	cd build && cmake .. && make

test: build
	cd build && ctest --output-on-failure

clean:
	rm -rf build
	rm -rf dist