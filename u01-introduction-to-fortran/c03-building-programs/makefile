# Compiler and flags
F90 = gfortran
FFLAGS = -J build -I build

# Directories
SRC_DIR   = src
BUILD_DIR = build
DIST_DIR  = dist

# Sources and programs
SOURCES := $(wildcard $(SRC_DIR)/*.f90)
PROGRAMS := $(basename $(notdir $(SOURCES)))

# Object files in BUILD_DIR
OBJECTS := $(patsubst $(SRC_DIR)/%.f90, $(BUILD_DIR)/%.o, $(SOURCES))

.PHONY: all clean dirs

# Build everything
all: dirs $(PROGRAMS:%=$(DIST_DIR)/%)

# Create necessary directories
dirs:
	mkdir -p $(BUILD_DIR) $(DIST_DIR)

# Rule to compile and link each program
$(DIST_DIR)/%: $(BUILD_DIR)/%.o
	$(F90) $(FFLAGS) -o $@ $^

# Compile each .f90 file into .o in build dir
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90
	$(F90) $(FFLAGS) -c $< -o $@

# Clean up
clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)
