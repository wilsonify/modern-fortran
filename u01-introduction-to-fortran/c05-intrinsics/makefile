# Compiler and directories
F90       = gfortran
CC        = gcc
SRC_DIR   = src
BUILD_DIR = build
DIST_DIR  = dist
LOG_DIR   = test_logs

# Program source list (relative path, no .f90 extension)
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
    i01-arrays/d23-RESHAPE \
    i02-bits/d01-BGE \
    i02-bits/d02-BGT \
    i02-bits/d03-BLE \
    i02-bits/d04-BLT \
    i02-bits/d05-BIT_SIZE \
    i02-bits/d06-BTEST \
    i02-bits/d07-STORAGE_SIZE \
    i02-bits/d08-LEADZ \
    i02-bits/d09-POPCNT \
    i02-bits/d10-POPPAR \
    i02-bits/d11-TRAILZ \
    i02-bits/d12-DSHIFTL \
    i02-bits/d13-DSHIFTR \
    i02-bits/d14-MERGE_BITS \
    i02-bits/d15-MVBITS \
    i02-bits/d16-IBITS \
    i02-bits/d17-IBCLR \
    i02-bits/d18-IBSET \
    i02-bits/d19-MASKL \
    i02-bits/d20-MASKR \
    i02-bits/d21-IPARITY \
    i02-bits/d22-IALL \
    i02-bits/d23-IAND \
    i02-bits/d24-IANY \
    i02-bits/d25-IEOR \
    i02-bits/d26-IOR \
    i02-bits/d27-NOT \
    i02-bits/d28-ISHFTC \
    i02-bits/d29-ISHFT \
    i02-bits/d30-SHIFTA \
    i02-bits/d31-SHIFTL \
    i02-bits/d32-SHIFTR \
    i03-characters/d01-LEN \
    i03-characters/d02-NEW_LINE \
    i03-characters/d03-REPEAT \
    i03-characters/d04-ACHAR \
    i03-characters/d05-CHAR \
    i03-characters/d06-IACHAR \
    i03-characters/d07-ICHAR \
    i03-characters/d08-INDEX \
    i03-characters/d09-SCAN \
    i03-characters/d10-VERIFY \
    i03-characters/d11-LGE \
    i03-characters/d12-LGT \
    i03-characters/d13-LLE \
    i03-characters/d14-LLT \
    i03-characters/d15-ADJUSTL \
    i03-characters/d16-ADJUSTR \
    i03-characters/d17-LEN_TRIM \
    i03-characters/d18-TRIM \
    i04-compilers/d01-COMPILER_OPTIONS \
    i04-compilers/d02-COMPILER_VERSION \
    i05-interfaces/d01-C_ASSOCIATED \
    i05-interfaces/d02-C_F_POINTER \
    i05-interfaces/d03-C_F_PROCPOINTER \
    i05-interfaces/d04-C_FUNLOC \
    i05-interfaces/d05-C_LOC \
    i05-interfaces/d06-C_SIZEOF

# Phony targets
.PHONY: all clean dirs check help

# Top-level default target
all: check dirs $(PROGRAMS:%=$(DIST_DIR)/%)

# Clean build artifacts
clean:
	@echo "Cleaning build/, dist/, and test_logs/..."
	rm -rf $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

# Create directories
dirs:
	@mkdir -p $(BUILD_DIR) $(DIST_DIR) $(LOG_DIR)

# Check environment
check:
	@command -v $(F90) >/dev/null 2>&1 || { echo >&2 "Error: '$(F90)' not found."; exit 1; }
	@command -v $(CC) >/dev/null 2>&1 || { echo >&2 "Error: '$(CC)' not found."; exit 1; }
	@echo "Found Fortran compiler: $$($(F90) --version | head -n 1)"
	@echo "Found C compiler:       $$($(CC) --version | head -n 1)"

# Fortran compilation rule
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90
	@mkdir -p $(dir $@)
	@echo "Compiling Fortran: $<"
	$(F90) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

# C compilation rule
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	@echo "Compiling C: $<"
	$(CC) -c $< -o $@

# Standard linking rule (Fortran-only)
$(BUILD_DIR)/%: $(BUILD_DIR)/%.o
	@mkdir -p $(dir $@)
	@echo "Linking: $@"
	$(F90) $< -o $@

# Custom rule: d02-C_F_POINTER with myC_func.c
$(BUILD_DIR)/i05-interfaces/d02-C_F_POINTER: \
	$(BUILD_DIR)/i05-interfaces/d02-C_F_POINTER.o \
	$(BUILD_DIR)/i05-interfaces/myC_func.o
	@mkdir -p $(dir $@)
	@echo "Linking Fortran + C (d02): $@"
	$(F90) $^ -o $@

# Custom rule: d03-C_F_PROCPOINTER with getIterFunc.c
$(BUILD_DIR)/i05-interfaces/d03-C_F_PROCPOINTER: \
	$(BUILD_DIR)/i05-interfaces/d03-C_F_PROCPOINTER.o \
	$(BUILD_DIR)/i05-interfaces/getIterFunc.o
	@mkdir -p $(dir $@)
	@echo "Linking Fortran + C (d03): $@"
	$(F90) $^ -o $@

# Rule to compile Fortran+C for demo_c_funloc
$(BUILD_DIR)/i05-interfaces/d04-C_FUNLOC: \
    $(BUILD_DIR)/i05-interfaces/d04-C_FUNLOC.o \
    $(BUILD_DIR)/i05-interfaces/call_fortran_with_funptr.o
	@mkdir -p $(dir $@)
	@echo "Linking Fortran + C (d04): $@"
	$(F90) $^ -o $@

# Distribute and run smoke test
$(DIST_DIR)/%: $(BUILD_DIR)/%
	@mkdir -p $(dir $@)
	@cp $< $@
	@echo "Running: $@"
	@./$@ > /dev/null 2>&1 || echo "FAILED: $@"

# Help target
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Main targets:"
	@echo "  all         Compile and distribute all programs"
	@echo "  clean       Remove build/, dist/, and test_logs/"
	@echo "  help        Show this message"
	@echo ""
	@echo "Individual dist targets:"
	@echo "  $(PROGRAMS:%=$(DIST_DIR)/%)"
