# Makefile for Fortran tutorial projects with structured build/dist directories

F90       = gfortran
SRC_DIR   = src
BUILD_DIR = build
DIST_DIR  = dist
LOG_DIR   = test_logs

PROGRAMS = \
  e01-hello \
  e02-function \
  e03-tabulate \
  e04-runtime_libs.f90

.PHONY: all check dirs build dist run clean help test $(PROGRAMS:%=test-%)

all: check dirs $(PROGRAMS:%=dist/%) test

check:
	@command -v $(F90) >/dev/null 2>&1 || \
	{ echo >&2 "Error: '$(F90)' is not installed or not in your PATH."; exit 1; }
	@echo "Found Fortran compiler: $$($(F90) --version | head -n 1)"

dirs:
	@mkdir -p $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

# Build rules
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90 | dirs
	@echo "Compiling $< -> $@"
	$(F90) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

$(BUILD_DIR)/%: $(BUILD_DIR)/%.o
	@echo "Linking $@"
	$(F90) $< -o $@

dist/%: $(BUILD_DIR)/%
	@cp $< $@
	@echo "Copied $< -> $@"

# Run a specific program
run-%: dist/%
	@echo "Running $<:"
	@./$<

# Test runners
test: check dirs $(PROGRAMS:%=test-%)

test-e04-runtime_libs:
	@ldd dist/e04-runtime_libs | tee $(LOG_DIR)/e04-runtime_libs.ldd

clean:
	@echo "Cleaning build, dist, and test logs..."
	@rm -rf $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Main targets:"
	@echo "  all         Compile and distribute all tutorial programs"
	@echo "  test        Run available tests (non-interactive only)"
	@echo "  clean       Remove build/, dist/, and test_logs/"
	@echo ""
	@echo "Program targets:"
	@echo "  $(PROGRAMS:%=dist/%)"
	@echo ""
	@echo "Run targets:"
	@echo "  $(PROGRAMS:%=run-%)"
	@echo ""
	@echo "Test targets:"
	@echo "  $(PROGRAMS:%=test-%)"
