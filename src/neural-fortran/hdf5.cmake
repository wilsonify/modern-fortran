set(hdf5_BUILD_TESTING FALSE)
add_subdirectory(external/hdf5)
find_library(HDF5_LIB hdf5)
message(STATUS "HDF5 library path: ${HDF5_LIB}")
