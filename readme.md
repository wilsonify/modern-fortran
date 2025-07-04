# Modern Fortran

**Modern Fortran** is a practical, 

example-driven book and codebase for learning modern Fortran

emphasizing **parallel programming**,
**data structures**, and **real-world scientific computing**.

It is designed for scientists, engineers, and researchers 
who want to solve challenging computational problems using a clean, modular, and high-performance Fortran style.

---

## What You'll Learn

- The essentials of modern Fortran syntax and organization  
- Functional programming and code reuse with modules  
- Numerical computing with arrays and formatted data  
- Interfacing with HDF5, JSON, and external environments  
- Shared and distributed parallelism (OpenMP, coarrays, collectives)  
- Realistic simulations and scientific workflows in Fortran

---

## Chapter Overview

Each chapter introduces one major concept with **hands-on code examples**:

| Chapter | Title |
|--------|-------|
| c01_introducing | Introducing |
| c02_minimal_working_app | Minimal Working App |
| c03_reusing | Reusing |
| c04_organizing | Organizing |
| c05_analyzing_arrays | Analyzing Arrays |
| c06_formatting_data | Formatting Data |
| c07_parallelizing | Parallelizing |
| c08_abstracting | Abstracting |
| c09_generalizing | Generalizing |
| c10_defining_operators | Defining Operators |
| c11_Interoperating | Interoperating |
| c12_parallelism_teams | Parallelism and Teams |

---

## Codebase Map

The repository also includes modular, deployable projects mapped to chapters and themes:

| Code Unit                                     | Focus |
|-----------------------------------------------|-------|
| `u00-base-fortran-image`                      | Docker base image – **c11** |
| `u01-introduction-to-fortran`                 | Fortran basics – **c01–c02** |
| `u02-functional-fortran`                      | Modularity, reuse – **c03, c08** |
| `u03-developing-statistical-software-fortran` | Structure and testing – **c03–c05** |
| `u04-datetime-fortran`                        | Types and formatting – **c05, c06** |
| `u05-json-fortran`                            | JSON I/O – **c06** |
| `u06-h5fortran`                               | HDF5 I/O – **c06** |
| `u07-tsunami`                                 | Simulation and parallelism – **c05, c07, c12** |
| `u08-weather-buoys`                           | I/O and modeling – **c05–c07** |
| `u09-modern_fortran`                          | Core book examples – **c03–c09** |
| `u10-neural-fortran`                          | ML and HPC parallelism – **c07–c12** |
| `u11-OpenCoarrays`                            | Coarray programming – **c12** |
| `u12-aws-lambda-example`                      | Interop and deployment – **c11** |


---

## Spotlight: Neural-Fortran

[Neural-Fortran](https://github.com/modern-fortran/neural-fortran) is a standalone library for building **neural networks in Fortran**, targeting scientific and engineering applications. It showcases modern Fortran techniques like:

- Matrix-based feedforward networks
- OpenMP and coarray parallelism
- Minimal external dependencies

---

## Getting Started

To start exploring:

1. **Clone the repository**  
   ```bash
   git clone https://github.com/modern-fortran/modern-fortran.git
    ```

2. Install a Fortran compiler

    gfortran (GCC)

    Intel Fortran (ifx)

    LFortran (experimental)

3. Read the chapters in src/modern_fortran/

4. Run the examples with make, cmake, or a simple Fortran build command.

# Contributing

We welcome contributions from the scientific computing community!

    Fork the repository and create a branch.

    Make your changes with clear commits.

    Submit a pull request with a brief explanation.


# Refernces

https://github.com/sustrik/libdill.git

https://github.com/jacobwilliams/json-fortran.git

https://github.com/geospace-code/h5fortran.git

https://github.com/HDFGroup/hdf5.git

https://github.com/wavebitscientific/functional-fortran.git

https://github.com/sourceryinstitute/OpenCoarrays
