# CMake version, project name, language
cmake_minimum_required(VERSION 3.20)

# If build type not specified, default to release
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Default build Release")
endif()

project(neural-fortran LANGUAGES C Fortran)

include(options.cmake)
include(compilers.cmake)
include(functional.cmake)
include(hdf5.cmake)
find_library(HDF5_LIB hdf5)
message(STATUS "HDF5 library path: ${HDF5_LIB}")

include(h5fortran.cmake)
include(json.cmake)

# library to archive (libneural.a)
add_library(neural
  nf.f90
  nf/nf_activation_1d.f90
  nf/nf_activation_3d.f90
  nf/nf_base_layer.f90
  nf/nf_conv2d_layer.f90
  nf/nf_conv2d_layer_submodule.f90
  nf/nf_datasets.f90
  nf/nf_datasets_submodule.f90
  nf/nf_datasets_mnist.f90
  nf/nf_datasets_mnist_submodule.f90
  nf/nf_dense_layer.f90
  nf/nf_dense_layer_submodule.f90
  nf/nf_flatten_layer.f90
  nf/nf_flatten_layer_submodule.f90
  nf/nf_input1d_layer.f90
  nf/nf_input1d_layer_submodule.f90
  nf/nf_input3d_layer.f90
  nf/nf_input3d_layer_submodule.f90
  nf/nf_keras.f90
  nf/nf_keras_submodule.f90
  nf/nf_layer_constructors.f90
  nf/nf_layer_constructors_submodule.f90
  nf/nf_layer.f90
  nf/nf_layer_submodule.f90
  nf/nf_loss.f90
  nf/nf_loss_submodule.f90
  nf/nf_maxpool2d_layer.f90
  nf/nf_maxpool2d_layer_submodule.f90
  nf/nf_network.f90
  nf/nf_network_submodule.f90
  nf/nf_optimizers.f90
  nf/nf_parallel.f90
  nf/nf_parallel_submodule.f90
  nf/nf_random.f90
  nf/nf_random_submodule.f90
  nf/nf_reshape_layer.f90
  nf/nf_reshape_layer_submodule.f90
  nf/io/nf_io_binary.f90
  nf/io/nf_io_binary_submodule.f90
  nf/io/nf_io_hdf5.f90
  nf/io/nf_io_hdf5_submodule.f90
)

target_link_libraries(neural PRIVATE
  functional::functional
  h5fortran::h5fortran
  HDF5::HDF5
  jsonfortran::jsonfortran
)

# install(TARGETS neural)

# Remove leading or trailing whitespace
# string(REGEX REPLACE "^ | $" "" LIBS "${LIBS}")


if(${PROJECT_NAME}_BUILD_EXAMPLES)
  add_subdirectory(example)
endif()
