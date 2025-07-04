# Makefile: Build Fortran source into ./build and ./dist directories

F90        = gfortran
SRC        = hello.f90
OBJ        = $(SRC:.f90=.o)
BUILD_DIR  = build
DIST_DIR   = dist
OBJ_FILES  = $(addprefix $(BUILD_DIR)/, $(OBJ))
EXE_NAME   = hello
EXE_PATH   = $(DIST_DIR)/$(EXE_NAME)

# Default target: build executable
all: check dirs $(EXE_PATH)

# Check if compiler is available
check:
	@command -v $(F90) >/dev/null 2>&1 || \
	  { echo "Error: $(F90) not found in PATH"; exit 1; }

# Create required directories
dirs:
	@mkdir -p $(BUILD_DIR) $(DIST_DIR)

# Compile source to object file in ./build
$(BUILD_DIR)/%.o: %.f90 | dirs
	$(F90) -c $< -J$(BUILD_DIR) -I$(BUILD_DIR) -o $@

# Link object files into executable in ./dist
$(EXE_PATH): $(OBJ_FILES)
	$(F90) $(OBJ_FILES) -o $@

# Remove all generated files
clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)

# Help message
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  all     - Build executable from source"
	@echo "  clean   - Remove build and distribution directories"
	@echo "  help    - Show this help message"
	@echo ""
	@echo "Structure:"
	@echo "  Object files: $(BUILD_DIR)/"
	@echo "  Executable:   $(EXE_PATH)"

.PHONY: all clean help check dirs
