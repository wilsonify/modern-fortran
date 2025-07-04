# Makefile for Fortran tutorial projects with structured build/dist directories

F90       = gfortran
SRC_DIR   = .
BUILD_DIR = build
DIST_DIR  = dist
LOG_DIR   = test_logs

PROGRAMS = e01-hello e02-variables e03-read_value e04-arithmetic e05-float

.PHONY: all check dirs build dist run clean help test $(PROGRAMS:%=test-%)

all: check dirs $(PROGRAMS:%=dist/%)

check:
	@command -v $(F90) >/dev/null 2>&1 || \
	{ echo >&2 "Error: '$(F90)' is not installed or not in your PATH."; exit 1; }
	@echo "Found Fortran compiler: $$($(F90) --version | head -n 1)"

dirs:
	@mkdir -p $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

# Build rules
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90 | dirs
	@echo "Compiling $< -> $@"
	$(F90) -c $< -o $@

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

test-e01-hello: dist/e01-hello
	@echo "Testing $<..."
	@./$< > $(LOG_DIR)/e01-hello.out
	@grep -q "Hello, World!" $(LOG_DIR)/e01-hello.out && echo "PASS: e01-hello" || (echo "FAIL: e01-hello"; exit 1)

test-e02-variables: dist/e02-variables
	@echo "Testing $<..."
	@./$< > $(LOG_DIR)/e02-variables.out
	@grep -q "amount" $(LOG_DIR)/e02-variables.out && echo "PASS: e02-variables" || (echo "FAIL: e02-variables"; exit 1)

test-e03-read_value:
	@echo "SKIP: e03-read_value (interactive input not supported in test)"

test-e04-arithmetic:
	@echo "SKIP: e04-arithmetic (interactive input not supported in test)"

test-e05-float: dist/e05-float
	@echo "Testing $<..."
	@./$< > $(LOG_DIR)/e05-float.out
	@echo "PASS: e05-float (no crash)"

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
