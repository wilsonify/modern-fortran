# Directories
BUILD_DIR = build
DIST_DIR = dist

.PHONY: dirs all build test clean install

dirs:
	mkdir -p $(BUILD_DIR)
	mkdir -p $(DIST_DIR)

all: clean dirs build test install

build: dirs
	cd $(BUILD_DIR) && cmake .. -DCMAKE_BUILD_TYPE=Release
	cd $(BUILD_DIR) && make

test: build
	cd $(BUILD_DIR) && ctest --output-on-failure

install: build dirs test
	cd $(BUILD_DIR) && cmake --install .

clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(DIST_DIR)
