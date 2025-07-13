---
layout: book
title: Type and Kind
permalink: /learn/intrinsics/TYPE_index
---

## Implicit Typing in Fortran

By default, Fortran allows implicit typing, meaning some variables do not need explicit declarations:

1. Variables starting with letters **i** through **n** are implicitly **integer**.
2. All other variables default to **real**.

However, it is best practice to **disable implicit typing** with: ``` implicit none ```

## Overview of Fortran Data Types

Fortran provides five basic intrinsic data types:

- **Integer type**  
  Holds whole number values only.

- **Real type**  
  Stores floating-point numbers such as 2.0, 3.1415, -100.876, etc.

- **Complex type**  
  Consists of a real and an imaginary part, stored in two consecutive floating-point units.

- **Logical type**  
  Has only two values: `.true.` and `.false.`

- **Character type**  
  Stores strings. Length can be specified by the `len` specifier; default length is 1.

These types can be of many **kinds**, often differing in storage size and precision. For example, a character variable could represent ASCII or Unicode characters.

You can also derive your own data types from these fundamental types.

## Types and Kinds

| Step | Category      | Intrinsics                                                      | Notes                                      |
|-------|---------------|-----------------------------------------------------------------|--------------------------------------------|
| 1     | TYPE:NUMERIC  | `int`, `real`, `dble`, `nint`, `aimag`, `cmplx`                | Basic type conversions and numeric types   |
| 2     | TYPE:LOGICAL  | `logical`                                                      | Logical type conversion                      |
| 3     | TYPE:MOLD     | `transfer`                                                    | Bitwise data representation                  |
| 4     | KIND:INQUIRY  | `kind`                                                        | Query kind parameter                         |
| 5     | KIND          | `selected_char_kind`, `selected_int_kind`, `selected_real_kind`| Selecting kinds based on constraints         |

---

## Types and kinds

| Category        | Page                                                                                     | Description                                  |
|-----------------|------------------------------------------------------------------------------------------|----------------------------------------------|
| *TYPE:NUMERIC*  | [__int__]({{site.baseurl}}/learn/intrinsics/INT)                                        | Convert to integer type                       |
| *TYPE:NUMERIC*  | [__real__]({{site.baseurl}}/learn/intrinsics/REAL)                                      | Convert to real type                          |
| *TYPE:NUMERIC*  | [__dble__]({{site.baseurl}}/learn/intrinsics/DBLE)                                      | Double conversion function                    |
| *TYPE:NUMERIC*  | [__nint__]({{site.baseurl}}/learn/intrinsics/NINT)                                      | Nearest whole number                          |
| *TYPE:NUMERIC*  | [__cmplx__]({{site.baseurl}}/learn/intrinsics/CMPLX)                                    | Complex conversion function                   |
| *TYPE:NUMERIC*  | [__aimag__]({{site.baseurl}}/learn/intrinsics/AIMAG)                                    | Imaginary part of complex number             |
| *TYPE:LOGICAL*  | [__logical__]({{site.baseurl}}/learn/intrinsics/LOGICAL)                                | Converts one kind of _logical_ variable to another |
| *TYPE:MOLD*     | [__transfer__]({{site.baseurl}}/learn/intrinsics/TRANSFER)                              | Transfer bit patterns                         |
| *KIND:INQUIRY*  | [__kind__]({{site.baseurl}}/learn/intrinsics/KIND)                                      | Kind of an entity                             |
| *KIND*          | [__selected_char_kind__]({{site.baseurl}}/learn/intrinsics/SELECTED_CHAR_KIND)          | Choose character kind such as "Unicode"     |
| *KIND*          | [__selected_int_kind__]({{site.baseurl}}/learn/intrinsics/SELECTED_INT_KIND)            | Choose integer kind                           |
| *KIND*          | [__selected_real_kind__]({{site.baseurl}}/learn/intrinsics/SELECTED_REAL_KIND)          | Choose real kind                              |

--

