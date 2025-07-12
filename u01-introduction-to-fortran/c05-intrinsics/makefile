F90       = gfortran
SRC_DIR   = src
BUILD_DIR = build
DIST_DIR  = dist
LOG_DIR   = test_logs

PROGRAMS = \
    i01-arrays/d01-MERGE \
    i01-arrays/d02-PACK \
    i01-arrays/d03-SPREAD \
    i01-arrays/d04-UNPACK \
    i01-arrays/d05-ALLOCATED \
    i01-arrays/d06-IS_CONTIGUOUS \
    i01-arrays/d07-LBOUND \
    i01-arrays/d08-RANK \
    i01-arrays/d09-SHAPE \
    i01-arrays/d10-SIZE \
    i01-arrays/d11-UBOUND \
    i01-arrays/d12-MAXLOC \
    i01-arrays/d13-MINLOC \
    i01-arrays/d14-FINDLOC \
    i01-arrays/d15-TRANSPOSE \
    i01-arrays/d16-ALL \
    i01-arrays/d17-ANY \
    i01-arrays/d18-COUNT \
    i01-arrays/d19-MAXVAL \
    i01-arrays/d20-MINVAL \
    i01-arrays/d21-PRODUCT \
    i01-arrays/d22-SUM \
    i01-arrays/d23-RESHAPE

.PHONY: all check dirs build dist run clean help test $(PROGRAMS:%=test-%)

all: check dirs $(PROGRAMS:%=$(DIST_DIR)/%) $(PROGRAMS:%=run-%)

clean:
	@echo "Cleaning build/, dist/, and test_logs/..."
	rm -rf $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)


check:
	@command -v $(F90) >/dev/null 2>&1 || \
	{ echo >&2 "Error: '$(F90)' is not installed or not in your PATH."; exit 1; }
	@echo "Found Fortran compiler: $$($(F90) --version | head -n 1)"

dirs:
	@mkdir -p $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

# Core build logic
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90
	@mkdir -p $(dir $@)
	@echo "Compiling $< -> $@"
	$(F90) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

$(BUILD_DIR)/%: $(BUILD_DIR)/%.o
	@mkdir -p $(dir $@)
	@echo "Linking $@"
	$(F90) $< -o $@

$(DIST_DIR)/%: $(BUILD_DIR)/%
	@mkdir -p $(dir $@)
	@cp $< $@
	@echo "Copied $< -> $@"

run: check dirs $(PROGRAMS:%=run-%)

run-%: $(DIST_DIR)/%
	@echo "Running $<:"
	@./$<


help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Main targets:"
	@echo "  all         Compile and distribute all tutorial programs"
	@echo "  run         Run all tutorial programs"
	@echo "  clean       Remove build/, dist/, and test_logs/"
	@echo ""
	@echo "Individual dist targets:"
	@echo "  $(PROGRAMS:%=$(DIST_DIR)/%)"
	@echo ""
	@echo "Individual run targets:"
	@echo "  $(PROGRAMS:%=run-%)"
