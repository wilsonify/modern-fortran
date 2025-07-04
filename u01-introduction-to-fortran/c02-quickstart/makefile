# Makefile for the Hello, World! Fortran example with structured build/dist directories

F90     = gfortran
SRC     = e01-hello.f90
BUILD   = build
DIST    = dist
OBJ     = $(BUILD)/hello.o
EXE     = $(BUILD)/hello
DIST_EXE= $(DIST)/hello

.PHONY: all check compile run clean help dirs

all: check dirs compile dist run

check:
	@command -v $(F90) >/dev/null 2>&1 || \
	{ echo >&2 "Error: '$(F90)' is not installed or not in your PATH."; exit 1; }
	@echo "Found Fortran compiler: $$($(F90) --version | head -n 1)"

dirs:
	@mkdir -p $(BUILD) $(DIST)

compile: $(SRC) | dirs
	@echo "Compiling $(SRC) to $(EXE)..."
	$(F90) -c $(SRC) -o $(OBJ)
	$(F90) $(OBJ) -o $(EXE)
	@echo "Compilation complete."

dist: $(EXE) | dirs
	@cp $(EXE) $(DIST_EXE)
	@echo "Copied binary to $(DIST_EXE)"

run: $(DIST_EXE)
	@echo "Running $(DIST_EXE):"
	@./$(DIST_EXE)

clean:
	@echo "Cleaning up build and dist directories..."
	@rm -rf $(BUILD) $(DIST)

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  all      Check compiler, compile and move binary to dist/"
	@echo "  check    Check if gfortran is installed"
	@echo "  dirs     Create build/ and dist/ directories"
	@echo "  compile  Compile the hello.f90 Fortran program"
	@echo "  dist     Copy the binary to the dist/ directory"
	@echo "  run      Run the distributed binary"
	@echo "  clean    Remove build/ and dist/ directories"
