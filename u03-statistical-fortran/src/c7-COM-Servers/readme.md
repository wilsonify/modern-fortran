# Integrating Fortran with MATLAB: COM Server vs DLL Approach

## Overview

This guide summarizes a developer forum discussion on integrating Fortran-compiled code into MATLAB. It compares two
interoperability strategies:

- **COM Server** (via `actxserver`)
- **DLL Interface** (via `loadlibrary` / `calllib` or `mex`)

The purpose is to help developers choose an appropriate method and understand potential pitfalls and implementation
details.

---

## 1. COM Server Approach

### 1.1 Context

- **Tools Used**: Intel Fortran Compiler, Visual Studio 2005
- **Objective**: Create a COM server (e.g., `Adder.AddingMachine`) accessible in MATLAB
- **Issue Encountered**: COM object loads, but properties are not visible in MATLAB:

```matlab
h = actxserver('Adder.AddingMachine', 'interface', 'IAdd');
get(h)  % Returns: 1x1 struct array with no fields
```

### 1.2 Diagnosis

- The `get(h)` command in MATLAB retrieves **properties**, not **methods**.
- Comparison with a working COM server (`ELogitSrvr.ELogitObj`) shows that properties are returned:

```matlab
h = actxserver('ELogitSrvr.ELogitObj');
get(h)
% Returns:
%   data_matrix: [1x53 char]
%   case_id:     [1x53 char]
%   ...
```

- The `Adder` example has only methods (`Add`, `Clear`, `GetValue`) and no defined properties.

### 1.3 Implementation Notes

#### Defining Properties in Fortran COM

Intel Fortran’s COM tools do not natively support COM **properties**. You must implement them manually using
getter/setter methods with matching `dispid` values:

```fortran
subroutine get_myproperty
    (...)
    subroutine put_myproperty(...)
```

This pattern enables MATLAB to recognize them as properties.

#### Expected Behavior

If no properties are defined, `get(h)` will return an empty struct. This is normal and indicates that only methods
exist.

---

## 2. DLL Interface Approach (Recommended)

### 2.1 Overview

An alternative to COM is to compile Fortran code into a **DLL** and call it from MATLAB. This method is often easier and
more maintainable.

### 2.2 Advantages

- **Simplicity**: Easier setup and fewer Windows-specific configurations
- **Performance**: Efficient for numerical routines
- **Compatibility**: Works well with scalars and arrays

### 2.3 Limitations

- Complex types (e.g., structs, derived types) are harder to pass between MATLAB and Fortran.
- Less integration with object-oriented interfaces compared to COM.

---

### 2.4 Fortran Interface Block: Common Pitfall

Avoid naming conflicts when using interface blocks:

#### Case 1: Subroutine in the same module

Do **not** use an explicit interface block:

```fortran
module my_mod
contains
    subroutine S_pol_single_prec
        (...)
    end subroutine
end module
```

#### Case 2: Subroutine in a separate file

Use an interface block:

```fortran
interface
    subroutine S_pol_single_prec
        (...)
    end subroutine
end interface
```

#### Case 3: Subroutine in a separate module

Use a `use` statement:

```fortran
use S_pol_gubbins
```

---

## 3. Summary of Recommendations

| Approach            | Pros                                            | Cons                                              |
|---------------------|-------------------------------------------------|---------------------------------------------------|
| **COM Server**      | Integrates with MATLAB via `actxserver`         | Complex setup, unclear property definition        |
| **DLL (Preferred)** | Easier to debug and maintain; faster at runtime | Poor struct support; no native object integration |

---

## 4. Further Reading & Resources

- *Developing Statistical Software in Fortran 95* by Lemmon & Schafer (especially Chapter 7)
- Intel Fortran Compiler documentation on COM server creation
- MATLAB documentation:
    - [`actxserver`](https://www.mathworks.com/help/matlab/ref/actxserver.html)
    - [`loadlibrary`](https://www.mathworks.com/help/matlab/ref/loadlibrary.html)
    - [`mex`](https://www.mathworks.com/help/matlab/mex-files.html)

---

## Appendix: Chapter Outline from Lemmon & Schafer (2005)

> Chapter 7: Creating COM Servers

### 7.1 A Simple Example

- 7.1.1 The `magic8` Fortran Module
- 7.1.2 The Magic8 COM Server
- 7.1.3 Installing the Server
- 7.1.4 Using It in Excel
- 7.1.5 Using It in S-PLUS and R
- 7.1.6 Using It in MATLAB
- 7.1.7 Using It in SAS
- 7.1.8 Exercises

### 7.2 COM Server Basics

- 7.2.1 COM References
- 7.2.2 COM, Windows, and .NET
- 7.2.3 COM vs. DLLs
- 7.2.4 Object-Oriented Contracts
- 7.2.5 In-process vs. Out-of-process Servers

### 7.3 Logistic Regression COM Example

- 7.3.1 Using Intel Visual Fortran
- 7.3.2 Project Setup
- 7.3.3 Naming the Server/Class
- 7.3.4 Fortran Style Guidelines
- 7.3.5 Auto-generating Code
- 7.3.6 Building the Project
- 7.3.7 Registering the Server
- 7.3.8 Creating Clients

### 7.4 Exercises

### 7.5 Internals of Fortran COM Servers

- 7.5.1 Generated Code Structure
- 7.5.2 IDL Files
- 7.5.3 Instance Code
- 7.5.4 Interface Code
- 7.5.5 Passing Arrays as Variants
- 7.5.6 Error Handling

### 7.6 Distribution and Installation

### 7.7 Additional Exercises  