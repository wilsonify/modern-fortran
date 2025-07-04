# Homebrew recipes for OpenCoarrays

## Install OpenCoarrays using Clang & GFortran, linking with MPICH

```
brew unlink openmpi || true # make sure you unlink OpenMPI
brew link mpich || brew install mpich # Link or install MPICH
brew install --build-from-source OpenCoarrays # Build OpenCoarrays from source while MPICH is linked
```

## Install OpenCoarrays using GCC 7 & GFortran 7, linking with MPICH

```
brew unlink openmpi || true
brew link mpich || brew install mpich
brew install --build-from-source --cc=gcc-7 OpenCoarrays
```

## Install MPICH & OpenCoarrays using gcc 7 (not clang)

```
brew unlink openmpi || true
brew reinstall --cc=gcc-7 --build-from-source mpich || \
   brew install --cc=gcc-7 --build-from-source mpich
brew install --build-from-source --cc=gcc-7 OpenCoarrays
```
