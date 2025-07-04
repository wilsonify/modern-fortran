FROM amazonlinux:2023 AS builder

# Install build dependencies
RUN yum -y groupinstall "Development Tools" && \
    yum -y install git cmake gcc-gfortran lapack-static blas-static && \
    yum clean all

WORKDIR /build

# Clone and build json-fortran
RUN git clone https://github.com/jacobwilliams/json-fortran.git && \
    mkdir json-fortran/build && cd json-fortran/build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local && \
    make -j$(nproc) && make install

# DEBUG: Show installed files
RUN echo "=== Installed json-fortran files ===" && \
    find /usr/local -name "libjsonfortran*" && \
    find /usr/local -name "*.mod"

# Copy source files
COPY src /build

# Compile and link Fortran files
RUN echo "=== Compiling json_matrix.f90 ===" && \
    gfortran -I/usr/local/jsonfortran-gnu-9.0.3/lib -J/usr/local/jsonfortran-gnu-9.0.3/lib -c json_matrix.f90 && \
    echo "=== Compiling linear_eq.f90 ===" && \
    gfortran -I/usr/local/jsonfortran-gnu-9.0.3/lib -J/usr/local/jsonfortran-gnu-9.0.3/lib -c linear_eq.f90 && \
    echo "=== Linking objects into linear_eq ===" && \
    gfortran -o linear_eq linear_eq.o json_matrix.o \
        /usr/local/jsonfortran-gnu-9.0.3/lib/libjsonfortran.a -llapack -lblas

# DEBUG: Show shared library dependencies
RUN echo "=== ldd output for linear_eq ===" && \
    ldd ./linear_eq || echo "ldd failed - binary may be statically linked"

FROM public.ecr.aws/amazonlinux/amazonlinux:2023 AS runtime

# Install only runtime dependencies (minimal set)
RUN yum -y install \
    lapack \
    blas \
    libgfortran \
    libquadmath \
    glibc \
    && yum clean all

# Copy the binary from the builder
COPY --from=builder /build/linear_eq /usr/local/bin/linear_eq

# Default command
CMD ["linear_eq"]