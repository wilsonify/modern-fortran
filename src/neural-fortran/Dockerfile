
FROM neural-fortran-builder:latest as builder
COPY . /usr/src/app
RUN mkdir -p /usr/src/app/external/hdf5/build
WORKDIR /usr/src/app/external/hdf5/build
RUN cmake .. && make install

RUN mkdir -p /usr/src/app/external/h5fortran/build
WORKDIR /usr/src/app/external/h5fortran/build
RUN cmake .. && make install

RUN mkdir -p /usr/src/app/build
WORKDIR /usr/src/app/build
RUN cmake .. && make && ctest

FROM neural-fortran-base:latest
COPY --from=builder /usr/src/app/build /app
WORKDIR /app
ENTRYPOINT [ "neural" ]