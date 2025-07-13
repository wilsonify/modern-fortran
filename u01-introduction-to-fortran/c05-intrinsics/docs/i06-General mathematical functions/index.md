---
layout: book
title: Mathematics
permalink: /learn/intrinsics/MATH_index
---

# General Mathematical Functions

---

## 1. Core Mathematical Operations (Basic Functions)

These are fundamental to nearly all numeric computation and rely on elementary algebra or calculus concepts:

| Category        | Page                                                                 | Description                        |
|----------------|----------------------------------------------------------------------|------------------------------------|
| MATH:BASIC      | [__sqrt__]({{site.baseurl}}/learn/intrinsics/SQRT)                  | ● Square-root function             |
| MATH:BASIC      | [__exp__]({{site.baseurl}}/learn/intrinsics/EXP)                    | ● Exponential function             |
| MATH:BASIC      | [__log__]({{site.baseurl}}/learn/intrinsics/LOG)                    | ● Natural logarithm function       |
| MATH:BASIC      | [__log10__]({{site.baseurl}}/learn/intrinsics/LOG10)                | ● Base 10 logarithm function       |
| MATH:BASIC      | [__hypot__]({{site.baseurl}}/learn/intrinsics/HYPOT)                | ● Euclidean distance function      |

---

## 2. Trigonometric and Hyperbolic Functions

These functions are rooted in geometry and calculus. Trigonometric functions often appear in wave mechanics, geometry, and Fourier analysis, while hyperbolic ones surface in hyperbolic PDEs and special relativity.

### Basic Trigonometric

| Category   | Page                                                                 | Description          |
|------------|----------------------------------------------------------------------|----------------------|
| MATH:TRIG  | [__sin__]({{site.baseurl}}/learn/intrinsics/SIN)                    | ● Sine function      |
| MATH:TRIG  | [__cos__]({{site.baseurl}}/learn/intrinsics/COS)                    | ● Cosine function    |
| MATH:TRIG  | [__tan__]({{site.baseurl}}/learn/intrinsics/TAN)                    | ● Tangent function   |

### Inverse Trigonometric

| Category   | Page                                                                 | Description             |
|------------|----------------------------------------------------------------------|-------------------------|
| MATH:TRIG  | [__asin__]({{site.baseurl}}/learn/intrinsics/ASIN)                  | ● Arcsine function      |
| MATH:TRIG  | [__acos__]({{site.baseurl}}/learn/intrinsics/ACOS)                  | ● Arccosine function    |
| MATH:TRIG  | [__atan__]({{site.baseurl}}/learn/intrinsics/ATAN)                  | ● Arctangent function   |
| MATH:TRIG  | [__atan2__]({{site.baseurl}}/learn/intrinsics/ATAN2)                | ● Arctangent function   |

### Hyperbolic Functions

| Category   | Page                                                                 | Description                   |
|------------|----------------------------------------------------------------------|-------------------------------|
| MATH:TRIG  | [__sinh__]({{site.baseurl}}/learn/intrinsics/SINH)                  | ● Hyperbolic sine function    |
| MATH:TRIG  | [__cosh__]({{site.baseurl}}/learn/intrinsics/COSH)                  | ● Hyperbolic cosine function  |
| MATH:TRIG  | [__tanh__]({{site.baseurl}}/learn/intrinsics/TANH)                  | ● Hyperbolic tangent function |

### Inverse Hyperbolic

| Category   | Page                                                                 | Description                          |
|------------|----------------------------------------------------------------------|--------------------------------------|
| MATH:TRIG  | [__asinh__]({{site.baseurl}}/learn/intrinsics/ASINH)                | ● Inverse hyperbolic sine function   |
| MATH:TRIG  | [__acosh__]({{site.baseurl}}/learn/intrinsics/ACOSH)                | ● Inverse hyperbolic cosine function |
| MATH:TRIG  | [__atanh__]({{site.baseurl}}/learn/intrinsics/ATANH)                | ● Inverse hyperbolic tangent function|

---

## 3. Random Number Generation

These functions involve internal state and statistical properties—essential for simulations and stochastic modeling.

| Category      | Page                                                                     | Description                                    |
|---------------|--------------------------------------------------------------------------|------------------------------------------------|
| MATH:RANDOM   | [__random_seed__]({{site.baseurl}}/learn/intrinsics/RANDOM_SEED)         | ● Initialize a pseudo-random number sequence   |
| MATH:RANDOM   | [__random_number__]({{site.baseurl}}/learn/intrinsics/RANDOM_NUMBER)     | ● Generate a pseudo-random number              |

---

## 4. Advanced Mathematical Functions (Special Functions)

These require deeper mathematical understanding and are commonly used in physics, statistics, and numerical modeling.

### Error Functions

| Category      | Page                                                                     | Description                         |
|---------------|--------------------------------------------------------------------------|-------------------------------------|
| MATH:HIGHER   | [__erf__]({{site.baseurl}}/learn/intrinsics/ERF)                          | ● Error function                    |
| MATH:HIGHER   | [__er__]({{site.baseurl}}/learn/intrinsics/ERFC)                          | ● Complementary error function      |
| MATH:HIGHER   | [__er_scaled__]({{site.baseurl}}/learn/intrinsics/ERFC_SCALED)           | ● Scaled complementary error func.  |

### Gamma Functions

| Category      | Page                                                                     | Description                          |
|---------------|--------------------------------------------------------------------------|--------------------------------------|
| MATH:HIGHER   | [__gamma__]({{site.baseurl}}/learn/intrinsics/GAMMA)                      | ● Gamma function                     |
| MATH:HIGHER   | [__log_gamma__]({{site.baseurl}}/learn/intrinsics/LOG_GAMMA)              | ● Logarithm of Gamma function        |

### Bessel Functions

| Category      | Page                                                                     | Description                                     |
|---------------|--------------------------------------------------------------------------|-------------------------------------------------|
| MATH:HIGHER   | [__bessel_j0__]({{site.baseurl}}/learn/intrinsics/BESSEL_J0)              | ● Bessel function of the first kind (order 0)   |
| MATH:HIGHER   | [__bessel_j1__]({{site.baseurl}}/learn/intrinsics/BESSEL_J1)              | ● Bessel function of the first kind (order 1)   |
| MATH:HIGHER   | [__bessel_jn__]({{site.baseurl}}/learn/intrinsics/BESSEL_JN)              | ● Bessel function of the first kind (general)   |
| MATH:HIGHER   | [__bessel_y0__]({{site.baseurl}}/learn/intrinsics/BESSEL_Y0)              | ● Bessel function of the second kind (order 0)  |
| MATH:HIGHER   | [__bessel_y1__]({{site.baseurl}}/learn/intrinsics/BESSEL_Y1)              | ● Bessel function of the second kind (order 1)  |
| MATH:HIGHER   | [__bessel_yn__]({{site.baseurl}}/learn/intrinsics/BESSEL_YN)              | ● Bessel function of the second kind (general)  |

---

## 5. Vector and Norm Functions

These operate on multi-dimensional data structures, commonly used in linear algebra, optimization, and numerical modeling.

| Category      | Page                                                                     | Description                  |
|---------------|--------------------------------------------------------------------------|------------------------------|
| MATH:HIGHER   | [__norm2__]({{site.baseurl}}/learn/intrinsics/NORM2)                      | ● Euclidean vector norm      |

---

###### fortran-lang intrinsic descriptions
