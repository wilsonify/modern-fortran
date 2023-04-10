set(h5fortran_BUILD_TESTING FALSE)
#build the rest runner
#include_directories(external/h5fortran/include)
find_library(HDF5_LIB hdf5)
message(STATUS "HDF5 library path: ${HDF5_LIB}")
add_subdirectory(external/h5fortran)
#link_directories(external/h5fortran/build)
