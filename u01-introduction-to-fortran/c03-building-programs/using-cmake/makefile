BUILD_DIR := build
EXECUTABLE := fortran_example

.PHONY: all configure build clean run

all: configure build

configure:
	@mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake ..

build:
	cd $(BUILD_DIR) && cmake --build .

clean:
	@rm -rf $(BUILD_DIR)

run:
	$(BUILD_DIR)/$(EXECUTABLE)
