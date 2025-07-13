# Compiler and directories
F90       = gfortran
CC        = gcc
SRC_DIR   = src
BUILD_DIR = build
DIST_DIR  = dist
LOG_DIR   = test_logs
COARRAY_FLAGS = -fcoarray=single

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
    i05-interfaces/d06-C_SIZEOF \
    i06-maths/d01-SQRT \
    i06-maths/d02-EXP \
    i06-maths/d03-LOG \
    i06-maths/d04-LOG10 \
    i06-maths/d05-HYPOT \
    i06-maths/d06-SIN \
    i06-maths/d07-COS \
    i06-maths/d08-TAN \
    i06-maths/d09-ASIN \
    i06-maths/d10-ACOS \
    i06-maths/d11-ATAN \
    i06-maths/d12-ATAN2 \
    i06-maths/d13-SINH \
    i06-maths/d14-COSH \
    i06-maths/d15-TANH \
    i06-maths/d16-ASINH \
    i06-maths/d17-ACOSH \
    i06-maths/d18-ATANH \
    i06-maths/d19-RANDOM_SEED \
    i06-maths/d20-RANDOM_NUMBER \
    i06-maths/d21-ERF \
    i06-maths/d22-ERFC \
    i06-maths/d23-ERFC_SCALED \
    i06-maths/d24-GAMMA \
    i06-maths/d25-LOG_GAMMA \
    i06-maths/d26-BESSEL_J0 \
    i06-maths/d27-BESSEL_J1 \
    i06-maths/d28-BESSEL_JN \
    i06-maths/d29-BESSEL_Y0 \
    i06-maths/d30-BESSEL_Y1 \
    i06-maths/d31-BESSEL_YN \
    i06-maths/d32-NORM2 \
    i07-numerics/d01-EXPONENT \
    i07-numerics/d02-FRACTION \
    i07-numerics/d03-NEAREST \
    i07-numerics/d04-RRSPACING \
    i07-numerics/d05-SCALE \
    i07-numerics/d06-SET_EXPONENT \
    i07-numerics/d07-SPACING \
    i07-numerics/d08-DIGITS \
    i07-numerics/d09-EPSILON \
    i07-numerics/d10-HUGE \
    i07-numerics/d11-MAXEXPONENT \
    i07-numerics/d12-MINEXPONENT \
    i07-numerics/d13-PRECISION \
    i07-numerics/d14-RADIX \
    i07-numerics/d15-RANGE \
    i07-numerics/d16-TINY \
    i08-values/d01-ABS \
    i08-values/d02-AINT \
    i08-values/d03-ANINT \
    i08-values/d04-CEILING \
    i08-values/d05-CONJG \
    i08-values/d06-DIM \
    i08-values/d07-DPROD \
    i08-values/d08-FLOOR \
    i08-values/d09-MAX \
    i08-values/d10-MIN \
    i08-values/d11-MOD \
    i08-values/d12-MODULO \
    i08-values/d13-SIGN \
    i09-collectives/d01-NUM_IMAGES \
    i09-collectives/d02-THIS_IMAGE \
    i09-collectives/d03-IMAGE_INDEX \
    i09-collectives/d04-EVENT_QUERY \
    i09-collectives/d05-CO_LBOUND \
    i09-collectives/d06-CO_UBOUND \
    i09-collectives/d07-ATOMIC_DEFINE \
    i09-collectives/d08-ATOMIC_REF \
    i09-collectives/d09-ATOMIC_ADD \
    i09-collectives/d10-ATOMIC_FETCH_ADD \
    i09-collectives/d11-ATOMIC_CAS \
    i09-collectives/d12-ATOMIC_AND \
    i09-collectives/d13-ATOMIC_OR \
    i09-collectives/d14-ATOMIC_XOR \
    i09-collectives/d15-ATOMIC_FETCH_AND \
    i09-collectives/d16-ATOMIC_FETCH_OR \
    i09-collectives/d17-ATOMIC_FETCH_XOR \
    i09-collectives/d18-CO_BROADCAST \
    i09-collectives/d19-CO_SUM \
    i09-collectives/d20-CO_MAX \
    i09-collectives/d21-CO_MIN \
    i09-collectives/d22-CO_REDUCE


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
	$(F90) $(COARRAY_FLAGS) -J$(BUILD_DIR) -I$(BUILD_DIR) -c $< -o $@

# C compilation rule
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	@echo "Compiling C: $<"
	$(CC) -c $< -o $@

# Standard linking rule (Fortran-only)
$(BUILD_DIR)/%: $(BUILD_DIR)/%.o
	@mkdir -p $(dir $@)
	@echo "Linking: $@"
	$(F90) $(COARRAY_FLAGS) $< -o $@

# Custom rule: d02-C_F_POINTER with myC_func.c
$(BUILD_DIR)/i05-interfaces/d02-C_F_POINTER: \
	$(BUILD_DIR)/i05-interfaces/d02-C_F_POINTER.o \
	$(BUILD_DIR)/i05-interfaces/myC_func.o
	@mkdir -p $(dir $@)
	@echo "Linking Fortran + C (d02): $@"
	$(F90) $(COARRAY_FLAGS) $^ -o $@

# Custom rule: d03-C_F_PROCPOINTER with getIterFunc.c
$(BUILD_DIR)/i05-interfaces/d03-C_F_PROCPOINTER: \
	$(BUILD_DIR)/i05-interfaces/d03-C_F_PROCPOINTER.o \
	$(BUILD_DIR)/i05-interfaces/getIterFunc.o
	@mkdir -p $(dir $@)
	@echo "Linking Fortran + C (d03): $@"
	$(F90) $(COARRAY_FLAGS) $^ -o $@

# Rule to compile Fortran+C for demo_c_funloc
$(BUILD_DIR)/i05-interfaces/d04-C_FUNLOC: \
    $(BUILD_DIR)/i05-interfaces/d04-C_FUNLOC.o \
    $(BUILD_DIR)/i05-interfaces/call_fortran_with_funptr.o
	@mkdir -p $(dir $@)
	@echo "Linking Fortran + C (d04): $@"
	$(F90) $(COARRAY_FLAGS) $^ -o $@

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
