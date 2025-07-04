F90       = gfortran
SRC_DIR   = src
BUILD_DIR = build
DIST_DIR  = dist
LOG_DIR   = test_logs

PROGRAMS = \
  e01-hello \
  e02-tabulate \
  e03-runtime_libs \
  e04-static-link \
  e05-dynamic-link

MODULES = user_functions mymath

MODULE_OBJS = $(patsubst %, $(BUILD_DIR)/%.o, $(MODULES))
PROGRAM_OBJS = $(patsubst %, $(BUILD_DIR)/%.o, $(PROGRAMS))
PROGRAM_BINS = $(patsubst %, $(BUILD_DIR)/%, $(PROGRAMS))

.PHONY: all check dirs clean help test $(PROGRAMS:%=run-%)

all: check dirs dist $(PROGRAMS:%=dist/%)

check:
	@command -v $(F90) >/dev/null 2>&1 || { echo >&2 "Error: '$(F90)' not found."; exit 1; }
	@echo "Using Fortran compiler: $$($(F90) --version | head -n 1)"

dirs:
	@mkdir -p $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

# Default object file rule for .f90 files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90 | dirs
	@echo "Compiling $< -> $@"
	$(F90) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

# Explicit .mod dependency rule
$(BUILD_DIR)/%.mod: $(BUILD_DIR)/%.o
	@echo "Ensuring module $@ exists"
	@test -f $@ || (echo "Error: $@ not found after compiling $<"; exit 1)

# Special object dependencies
PRG_DEPS_e02-tabulate = $(BUILD_DIR)/user_functions.o
PRG_DEPS_e04-static-link = $(BUILD_DIR)/mymath.o $(BUILD_DIR)/mymath.mod
PRG_DEPS_e05-dynamic-link = $(BUILD_DIR)/libmymath.so

# Link rule for most programs
$(BUILD_DIR)/%: $(BUILD_DIR)/%.o $(PRG_DEPS_%) | dirs
	@echo "Linking $@"
	$(F90) $^ -o $@

# Shared library build
$(BUILD_DIR)/mymath_pic.o: $(SRC_DIR)/mymath.f90 | dirs
	@echo "Compiling $< with -fpic for shared lib"
	$(F90) -fpic -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

$(BUILD_DIR)/libmymath.so: $(BUILD_DIR)/mymath_pic.o
	@echo "Linking shared library $@"
	$(F90) -shared -o $@ $^

# Dynamic link explicitly needs -L + -l flags
$(BUILD_DIR)/e05-dynamic-link: LDFLAGS = -L$(BUILD_DIR) -lmymath

# Distribute binaries
dist/%: $(BUILD_DIR)/%
	@cp $< $@
	@echo "Copied $< -> $@"

# Run wrapper
run-%: dist/%
	@echo "Running $<"
	@LD_LIBRARY_PATH=$(BUILD_DIR):$$LD_LIBRARY_PATH ./$<

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
