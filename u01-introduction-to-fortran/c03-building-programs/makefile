F90       = gfortran
SRC_DIR   = src
BUILD_DIR = build
DIST_DIR  = dist
LOG_DIR   = test_logs

# Programs to build
PROGRAMS = \
  e01-hello \
  e02-tabulate \
  e03-runtime_libs \
  e04-static-link \
  e05-dynamic-link

# Modules and their sources
MODULES = user_functions mymath

# Object files for modules
MODULE_OBJS = $(patsubst %, $(BUILD_DIR)/%.o, $(MODULES))

# Program objects
PROGRAM_OBJS = $(patsubst %, $(BUILD_DIR)/%.o, $(PROGRAMS))

.PHONY: all check dirs clean help test $(PROGRAMS:%=run-%)

all: check dirs dist $(PROGRAMS:%=dist/%)

check:
	@command -v $(F90) >/dev/null 2>&1 || { echo >&2 "Error: '$(F90)' not found."; exit 1; }
	@echo "Using Fortran compiler: $$($(F90) --version | head -n 1)"

dirs:
	@mkdir -p $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

# Compile modules first
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90 | dirs
	@echo "Compiling module $< -> $@"
	$(F90) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

# Compile program objects
# Programs that depend on modules must depend on their module .o to get .mod files
$(BUILD_DIR)/hello.o: $(SRC_DIR)/e01-hello.f90 | dirs
	@echo "Compiling $< -> $@"
	$(F90) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

$(BUILD_DIR)/e02-tabulate.o: $(SRC_DIR)/e02-tabulate.f90 $(BUILD_DIR)/user_functions.o | dirs
	@echo "Compiling $< -> $@"
	$(F90) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

$(BUILD_DIR)/e03-runtime_libs.o: $(SRC_DIR)/e03-runtime_libs.f90 | dirs
	@echo "Compiling $< -> $@"
	$(F90) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

$(BUILD_DIR)/e04-static-link.o: $(SRC_DIR)/e04-static-link.f90 $(BUILD_DIR)/mymath.o | dirs
	@echo "Compiling $< -> $@"
	$(F90) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

$(BUILD_DIR)/e05-dynamic-link.o: $(SRC_DIR)/e05-dynamic-link.f90 $(BUILD_DIR)/mymath.o | dirs
	@echo "Compiling $< -> $@"
	$(F90) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

# Link programs with needed module objects
$(BUILD_DIR)/e01-hello: $(BUILD_DIR)/e01-hello.o
	@echo "Linking $@"
	$(F90) $< -o $@

$(BUILD_DIR)/e02-tabulate: $(BUILD_DIR)/e02-tabulate.o $(BUILD_DIR)/user_functions.o
	@echo "Linking $@"
	$(F90) $^ -o $@

$(BUILD_DIR)/e03-runtime_libs: $(BUILD_DIR)/e03-runtime_libs.o
	@echo "Linking $@"
	$(F90) $< -o $@

$(BUILD_DIR)/e04-static-link: $(BUILD_DIR)/e04-static-link.o $(BUILD_DIR)/mymath.o
	@echo "Linking $@"
	$(F90) $^ -o $@

# For dynamic linking, compile mymath.o with -fpic and link shared lib
$(BUILD_DIR)/mymath_pic.o: $(SRC_DIR)/mymath.f90 | dirs
	@echo "Compiling $< for shared library -> $@"
	$(F90) -fpic -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

$(BUILD_DIR)/libmymath.so: $(BUILD_DIR)/mymath_pic.o
	@echo "Linking shared library $@"
	$(F90) -shared -o $@ $^

# Link e05-dynamic-link with shared library
$(BUILD_DIR)/e05-dynamic-link: $(BUILD_DIR)/e05-dynamic-link.o $(BUILD_DIR)/libmymath.so
	@echo "Linking $@ with shared library"
	$(F90) $< -L$(BUILD_DIR) -lmymath -o $@

# Compile modules with explicit rules
$(BUILD_DIR)/user_functions.o: $(SRC_DIR)/user_functions.f90 | dirs
	@echo "Compiling $< -> $@"
	$(F90) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

$(BUILD_DIR)/mymath.o: $(SRC_DIR)/mymath.f90 | dirs
	@echo "Compiling $< -> $@"
	$(F90) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

# Copy to dist directory
dist/%: $(BUILD_DIR)/%
	@cp $< $@
	@echo "Copied $< -> $@"

# Run targets
run-%: dist/%
	@echo "Running $<"
	@LD_LIBRARY_PATH=$(BUILD_DIR):$$LD_LIBRARY_PATH ./$<

# Test (placeholder)
test:
	@echo "No tests implemented"

clean:
	@echo "Cleaning build, dist, and logs..."
	@rm -rf $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

help:
	@echo "Usage: make [target]"
	@echo "Targets:"
	@echo "  all       Build all programs"
	@echo "  clean     Remove build/, dist/, and logs/"
	@echo "  run-<prg> Run a specific program (from dist/)"
	@echo "  test      Placeholder for tests"
