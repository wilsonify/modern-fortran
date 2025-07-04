# Compiler and flags
F90 = gfortran
FFLAGS = -J $(BUILD_DIR) -I $(BUILD_DIR)

# Directories
SRC_DIR   = src
BUILD_DIR = build
DIST_DIR  = dist

# Source files
MODULES := user_functions mymath
MODULE_SRCS := $(addprefix $(SRC_DIR)/, $(addsuffix .f90, $(MODULES)))
MODULE_OBJS := $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(MODULES)))

PROGRAM_SRCS := $(filter-out $(MODULE_SRCS), $(wildcard $(SRC_DIR)/*.f90))
PROGRAMS := $(basename $(notdir $(PROGRAM_SRCS)))
PROGRAM_OBJS := $(patsubst $(SRC_DIR)/%.f90, $(BUILD_DIR)/%.o, $(PROGRAM_SRCS))
PROGRAM_BINS := $(addprefix $(DIST_DIR)/, $(PROGRAMS))

.PHONY: all clean dirs

all: dirs $(PROGRAM_BINS)

# Create necessary directories
dirs:
	mkdir -p $(BUILD_DIR) $(DIST_DIR)

# Link each program
$(DIST_DIR)/%: $(BUILD_DIR)/%.o $(MODULE_OBJS)
	$(F90) $(FFLAGS) -o $@ $^

# Compile program source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90 $(MODULE_OBJS)
	$(F90) $(FFLAGS) -c $< -o $@

# Compile module source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90
	$(F90) $(FFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)
