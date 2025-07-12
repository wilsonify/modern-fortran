# Makefile for Fortran tutorial projects with structured build/dist directories

F90       = gfortran
SRC_DIR   = src
BUILD_DIR = build
DIST_DIR  = dist
LOG_DIR   = test_logs

# Debug mode support
ifeq ($(DEBUG),1)
  HIDE =
  FFLAGS = -Wall -g -fcheck=all -J$(BUILD_DIR) -I$(BUILD_DIR)
else
  HIDE = @
  FFLAGS = -J$(BUILD_DIR) -I$(BUILD_DIR)
endif

# Modules and submodules (no .f90 extensions here)
MODULES    := kind_parameter mod_math math_stats math_array_ops multidim_array_ops elementwise_root
SUBMODULES := mod_math_square math_stats_variance

# Programs (no .f90 extensions)
PROGRAMS := \
  e01-tabulate \
  e02-floating-point \
  e03-integer-division \
  e04-demo_sum_of_squares \
  e05-demo_variance \
  e06-demo_array_usage \
  e07-demo_multidim_arrays \
  e08-demo_elementwise_root \
  e09-allocatable_array_demo \
  e10_file_io_demo \
  e11_callbacks_demo

# Derived filenames
MODULE_OBJS     := $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(MODULES)))
SUBMODULE_OBJS  := $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(SUBMODULES)))
PROGRAM_OBJS    := $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(PROGRAMS)))
PROGRAM_BINS    := $(addprefix $(BUILD_DIR)/, $(PROGRAMS))
PROGRAM_DISTS   := $(addprefix $(DIST_DIR)/, $(PROGRAMS))

.PHONY: all check dirs clean help test run $(PROGRAMS:%=test-%)

## --------------------
## Top-Level Targets
## --------------------

all: check dirs $(PROGRAM_DISTS) test

clean:
	@echo "Cleaning build/, dist/, and test_logs/..."
	@rm -rf $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

check:
	@command -v $(F90) >/dev/null 2>&1 || { echo >&2 "Error: '$(F90)' is not installed."; exit 1; }
	@echo "Found Fortran compiler: $$($(F90) --version | head -n 1)"

dirs:
	@mkdir -p $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

## --------------------
## Compilation Rules
## --------------------

# Compile modules, submodules, and programs from src/
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90 | dirs
	$(HIDE)echo "Compiling $< -> $@"
	$(HIDE)$(F90) $(FFLAGS) -c $< -o $@

# Explicit submodule dependencies
$(BUILD_DIR)/mod_math_square.o: $(BUILD_DIR)/mod_math.o
$(BUILD_DIR)/math_stats_variance.o: $(BUILD_DIR)/math_stats.o

# Explicit program module dependencies
$(BUILD_DIR)/e01-tabulate.o: $(BUILD_DIR)/kind_parameter.o
$(BUILD_DIR)/e02-floating-point.o: $(BUILD_DIR)/kind_parameter.o
$(BUILD_DIR)/e03-integer-division.o: $(BUILD_DIR)/kind_parameter.o
$(BUILD_DIR)/e04-demo_sum_of_squares.o: $(BUILD_DIR)/mod_math.o $(BUILD_DIR)/mod_math_square.o
$(BUILD_DIR)/e05-demo_variance.o: $(BUILD_DIR)/math_stats.o $(BUILD_DIR)/math_stats_variance.o

## --------------------
## Linking Programs
## --------------------

# Link each program with its own object plus all module and submodule objects
$(BUILD_DIR)/%: $(BUILD_DIR)/%.o $(MODULE_OBJS) $(SUBMODULE_OBJS)
	$(HIDE)echo "Linking $@"
	$(HIDE)$(F90) $^ -o $@

# Copy executables to dist/
$(DIST_DIR)/%: $(BUILD_DIR)/%
	$(HIDE)cp $< $@
	$(HIDE)echo "Copied $< -> $@"

## --------------------
## Run Targets
## --------------------

run-%: $(DIST_DIR)/%
	@echo "Running $<:"
	@./$<

## --------------------
## Test Targets
## --------------------
test: check dirs $(PROGRAMS:%=test-%)

test-e01-tabulate: dist/e01-tabulate
	@./$< > $(LOG_DIR)/e01-tabulate.out
	@grep -q "" $(LOG_DIR)/e01-tabulate.out && echo "PASS e01-tabulate" || (echo "FAIL: e01-tabulate"; exit 1)

test-e02-floating-point: dist/e02-floating-point
	@./$< > $(LOG_DIR)/e02-floating-point.out
	@grep -q "" $(LOG_DIR)/e02-floating-point.out && echo "PASS e02-floating-point" || (echo "FAIL: e02-floating-point"; exit 1)

test-e03-integer-division: dist/e03-integer-division
	@./$< > $(LOG_DIR)/e03-integer-division.out
	@grep -q "" $(LOG_DIR)/e03-integer-division.out && echo "PASS e03-integer-division" || (echo "FAIL: e03-integer-division"; exit 1)

test-e04-demo_sum_of_squares: dist/e04-demo_sum_of_squares
	@./$< > $(LOG_DIR)/e04-demo_sum_of_squares.out
	@grep -q "" $(LOG_DIR)/e04-demo_sum_of_squares.out && echo "PASS e04-demo_sum_of_squares" || (echo "FAIL: e04-demo_sum_of_squares"; exit 1)

test-e05-demo_variance: dist/e05-demo_variance
	@./$< > $(LOG_DIR)/e05-demo_variance.out
	@grep -q "" $(LOG_DIR)/e05-demo_variance.out && echo "PASS e05-demo_variance" || (echo "FAIL: e05-demo_variance"; exit 1)

test-e06-demo_array_usage: dist/e06-demo_array_usage
	@./$< > $(LOG_DIR)/e06-demo_array_usage.out
	@grep -q "" $(LOG_DIR)/e06-demo_array_usage.out && echo "PASS e06-demo_array_usage" || (echo "FAIL: e06-demo_array_usage"; exit 1)

test-e07-demo_multidim_arrays: dist/e07-demo_multidim_arrays
	@./$< > $(LOG_DIR)/e07-demo_multidim_arrays.out
	@grep -q "" $(LOG_DIR)/e07-demo_multidim_arrays.out && echo "PASS e07-demo_multidim_arrays" || (echo "FAIL: e07-demo_multidim_arrays"; exit 1)

test-e08-demo_elementwise_root: dist/e08-demo_elementwise_root
	@./$< > $(LOG_DIR)/e08-demo_elementwise_root.out
	@grep -q "" $(LOG_DIR)/e08-demo_elementwise_root.out && echo "PASS e08-demo_elementwise_root" || (echo "FAIL: e08-demo_elementwise_root"; exit 1)

test-e09-allocatable_array_demo: dist/e09-allocatable_array_demo
	@./$< > $(LOG_DIR)/e09-allocatable_array_demo.out
	@grep -q "" $(LOG_DIR)/e09-allocatable_array_demo.out && echo "PASS e09-allocatable_array_demo" || (echo "FAIL: e09-allocatable_array_demo"; exit 1)

test-e10_file_io_demo: dist/e10_file_io_demo
	@./$< > $(LOG_DIR)/e10_file_io_demo.out
	@grep -q "" $(LOG_DIR)/e10_file_io_demo.out && echo "PASS e10_file_io_demo" || (echo "FAIL: e10_file_io_demo"; exit 1)

test-e11_callbacks_demo: dist/e11_callbacks_demo
	@./$< > $(LOG_DIR)/e11_callbacks_demo.out
	@grep -q "" $(LOG_DIR)/e11_callbacks_demo.out && echo "PASS e11_callbacks_demo" || (echo "FAIL: e11_callbacks_demo"; exit 1)



help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Main targets:"
	@echo "  all         Compile and distribute all programs"
	@echo "  test        Run all tests"
	@echo "  clean       Remove build/, dist/, and test_logs/"
	@echo ""
	@echo "Run targets:"
	@echo "  $(PROGRAMS:%=\nrun-%)"
	@echo ""
	@echo "Test targets:"
	@echo "  $(PROGRAMS:%=\ntest-%)"
	@echo ""
	@echo "Debug mode:"
	@echo "  make DEBUG=1 [target]"
