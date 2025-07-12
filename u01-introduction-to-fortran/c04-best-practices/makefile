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

# Modules and submodules
MODULES    := kind_parameter mod_math math_stats math_array_ops multidim_array_ops.f90
SUBMODULES := mod_math_square math_stats_variance

# Programs
PROGRAMS := \
  e01-tabulate \
  e02-floating-point \
  e03-integer-division \
  e04-demo_sum_of_squares \
  e05-demo_variance \
  e06-demo_array_usage \
  e07-demo_multidim_arrays.f90

# Derived filenames
MODULE_OBJS     := $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(MODULES)))
SUBMODULE_OBJS  := $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(SUBMODULES)))
PROGRAM_OBJS    := $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(PROGRAMS)))
PROGRAM_BINS    := $(addprefix $(BUILD_DIR)/, $(PROGRAMS))
PROGRAM_DISTS   := $(addprefix dist/, $(PROGRAMS))

.PHONY: all check dirs clean help test run $(PROGRAMS:%=test-%)

## --------------------
## Top-Level Targets
## --------------------

all: check dirs $(PROGRAM_DISTS) test

check:
	@command -v $(F90) >/dev/null 2>&1 || { echo >&2 "Error: '$(F90)' is not installed."; exit 1; }
	@echo "Found Fortran compiler: $$($(F90) --version | head -n 1)"

dirs:
	@mkdir -p $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

## --------------------
## Compilation Rules
## --------------------

# General object compilation
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90 | dirs
	$(HIDE)echo "Compiling $< -> $@"
	$(HIDE)$(F90) $(FFLAGS) -c $< -o $@

# Submodule depends on module
$(BUILD_DIR)/mod_math_square.o: $(BUILD_DIR)/mod_math.o
$(BUILD_DIR)/math_stats_variance.o: $(BUILD_DIR)/math_stats.o

# Program dependencies
$(BUILD_DIR)/e01-tabulate.o: $(BUILD_DIR)/kind_parameter.o
$(BUILD_DIR)/e02-floating-point.o: $(BUILD_DIR)/kind_parameter.o
$(BUILD_DIR)/e03-integer-division.o: $(BUILD_DIR)/kind_parameter.o
$(BUILD_DIR)/e04-demo_sum_of_squares.o: $(BUILD_DIR)/mod_math.o $(BUILD_DIR)/mod_math_square.o
$(BUILD_DIR)/e05-demo_variance.o: $(BUILD_DIR)/math_stats.o $(BUILD_DIR)/math_stats_variance.o

# Link objects into executables
$(BUILD_DIR)/%: $(BUILD_DIR)/%.o
	$(HIDE)echo "Linking $@"
	$(HIDE)$(F90) $^ $(MODULE_OBJS) $(SUBMODULE_OBJS) -o $@

# Copy executable to dist/
dist/%: $(BUILD_DIR)/%
	$(HIDE)cp $< $@
	$(HIDE)echo "Copied $< -> $@"

## --------------------
## Run Targets
## --------------------

run-%: dist/%
	@echo "Running $<:"
	@./$<

## --------------------
## Test Targets
## --------------------

test: check dirs $(PROGRAMS:%=test-%)

test-e01-tabulate:
	@./dist/e01-tabulate > $(LOG_DIR)/e01-tabulate.out
	@grep -q "" $(LOG_DIR)/e01-tabulate.out && echo "PASS: e01-tabulate" || (echo "FAIL: e01-tabulate"; exit 1)

test-e02-floating-point:
	@./dist/e02-floating-point > $(LOG_DIR)/e02-floating-point.out
	@grep -q "" $(LOG_DIR)/e02-floating-point.out && echo "PASS: e02-floating-point" || (echo "FAIL: e02-floating-point"; exit 1)

test-e03-integer-division:
	@./dist/e03-integer-division > $(LOG_DIR)/e03-integer-division.out
	@grep -q "" $(LOG_DIR)/e03-integer-division.out && echo "PASS: e03-integer-division" || (echo "FAIL: e03-integer-division"; exit 1)

test-e04-demo_sum_of_squares:
	@./dist/e04-demo_sum_of_squares > $(LOG_DIR)/e04-demo_sum_of_squares.out
	@grep -q "" $(LOG_DIR)/e04-demo_sum_of_squares.out && echo "PASS: e04-demo_sum_of_squares" || (echo "FAIL: e04-demo_sum_of_squares"; exit 1)

test-e05-demo_variance:
	@./dist/e05-demo_variance > $(LOG_DIR)/e05-demo_variance.out
	@grep -q "" $(LOG_DIR)/e05-demo_variance.out && echo "PASS: e05-demo_variance" || (echo "FAIL: e05-demo_variance"; exit 1)

## --------------------
## Utility Targets
## --------------------

clean:
	@echo "Cleaning build/, dist/, and test_logs/..."
	@rm -rf $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Main targets:"
	@echo "  all         Compile and distribute all programs"
	@echo "  test        Run all tests"
	@echo "  clean       Remove build/, dist/, and test_logs/"
	@echo ""
	@echo "Run targets:"
	@echo "  $(PROGRAMS:%=run-%)"
	@echo "Test targets:"
	@echo "  $(PROGRAMS:%=test-%)"
	@echo ""
	@echo "Debug mode:"
	@echo "  make DEBUG=1 [target]"
