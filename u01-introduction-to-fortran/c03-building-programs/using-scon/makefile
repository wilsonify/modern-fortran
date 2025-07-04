FC = gfortran
FFLAGS = -J build -I build
SRC_DIR = src
BUILD_DIR = build
DIST_DIR = dist

PROGRAMS = e01-hello e02-tabulate e03-runtime_libs e04-static-link e05-dynamic-link
MODULES = user_functions mymath

MODULE_OBJS = $(patsubst %, $(BUILD_DIR)/%.o, $(MODULES))
PROGRAM_OBJS = $(patsubst %, $(BUILD_DIR)/%.o, $(PROGRAMS))
PROGRAM_BINS = $(patsubst %, $(DIST_DIR)/%, $(PROGRAMS))

.PHONY: all clean dirs

all: dirs $(PROGRAM_BINS)

dirs:
	mkdir -p $(BUILD_DIR) $(DIST_DIR)

# Compile all .f90 files into .o files with .mod files in build/
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90 | dirs
	$(FC) $(FFLAGS) -c $< -o $@

# Link each program using its .o and the module .o files
$(DIST_DIR)/%: $(BUILD_DIR)/%.o $(MODULE_OBJS)
	$(FC) $(FFLAGS) $^ -o $@

clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)
