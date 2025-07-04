# Makefile to install GFortran on various platforms

.PHONY: help linux-debian linux-rpm linux-arch macos homebrew macports fink xcode wsl openbsd opencoarrays

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Available targets:"
	@echo "  linux-debian     Install GFortran on Debian/Ubuntu/Mint"
	@echo "  linux-rpm        Install GFortran on RedHat/CentOS/Fedora"
	@echo "  linux-arch       Install GFortran on Arch/Manjaro"
	@echo "  macos            Show macOS installation options"
	@echo "  xcode            Install Xcode CLI tools"
	@echo "  homebrew         Install GCC via Homebrew"
	@echo "  macports         Install GCC via MacPorts"
	@echo "  fink             Show Fink GCC installation link"
	@echo "  wsl              Setup instructions for WSL"
	@echo "  openbsd          Install G95 on OpenBSD"
	@echo "  opencoarrays     Install OpenCoarrays (Linux/macOS only)"

linux-debian:
	@which gfortran || echo "GFortran not found, installing..."
	sudo apt-get update
	sudo apt-get install -y gfortran

# Optional versions
gfortran-7:
	sudo apt-get install -y gfortran-7

gfortran-10:
	sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
	sudo apt-get update
	sudo apt-get install -y gfortran-10

linux-rpm:
	sudo yum install -y gcc-gfortran || sudo dnf install -y gcc-gfortran

linux-arch:
	sudo pacman -Syu --noconfirm gcc-fortran

macos:
	@echo "Options to install GFortran on macOS:"
	@echo "  make xcode        # Install Xcode CLI tools"
	@echo "  make homebrew     # Install via Homebrew"
	@echo "  make fink         # See Fink package link"
	@echo "  make macports     # Install via MacPorts"
	@echo "  Binaries: https://github.com/fxcoudert/gfortran-for-macOS/releases"

xcode:
	xcode-select --install

homebrew:
	brew install gcc

macports:
	@echo "Searching for GCC packages via MacPorts..."
	port search gcc
	@echo "To install a version: sudo port install gcc10"

fink:
	@echo "Visit the Fink GCC package browser:"
	@echo "https://pdb.finkproject.org/pdb/browse.php?summary=GNU+Compiler+Collection+Version"

wsl:
	@echo "Install WSL and set up Ubuntu from the Microsoft Store."
	@echo "Then run 'make linux-debian' from within WSL."

openbsd:
	sudo pkg_add g95
	@echo "To test, run: egfortran -v"

opencoarrays:
	@echo "Visit http://www.opencoarrays.org/ for full instructions."
	@echo "To run: cafrun -n <images> ./executable"
