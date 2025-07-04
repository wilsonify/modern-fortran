# Fortran Linear Equation Solver in Docker

A Fortran-based program to solve linear systems 
of the form **Ax = b**, via LAPACK and BLAS  

using `json-fortran` for JSON input parsing. 
 
containerized with Amazon Linux 2023.

suitable for running as a Lambda Function

---

## Features

- JSON input via standard command-line arguments
- Solves dense linear systems using LAPACK
- Multi-stage Docker build with minimal runtime image
- Uses [`json-fortran`](https://github.com/jacobwilliams/json-fortran) for JSON parsing

---

## Usage

```bash
# make build
docker build --progress=plain -t fortran-lambda:latest .

# make test
docker run -it --rm fortran-lambda:latest /usr/local/bin/linear_eq \
'{"a": [[1,2],[3,4]], "b":[7,10]}'


```
### expected output

```
x(1)=1.00
x(2)=2.00
```