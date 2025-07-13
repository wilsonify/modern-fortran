---
layout: book
title: General State of variables and I/O
permalink: /learn/intrinsics/STATE_index
---

### General and Miscellaneous Intrinsics

These intrinsics provide utilities for querying the state of variables, checking associations, managing memory, and performing dynamic type analysis. The list below is ordered from conceptually simplest to most complex:

---

1. **`present`** – *Optional Argument Check*  
   Use to determine whether an optional dummy argument was passed to a procedure.

| *STATE*   |||| [__present__]({{site.baseurl}}/learn/intrinsics/PRESENT)                    || &#9679; Determine whether an optional dummy argument is specified |

---

2. **`associated`** – *Pointer Association*  
   Test whether a pointer is currently associated with a target or another pointer.

| *STATE*   |||| [__associated__]({{site.baseurl}}/learn/intrinsics/ASSOCIATED)              || &#9679; Status of a pointer or pointer/target pair |

---

3. **`is_iostat_end`** – *File I/O End-of-File Check*  
   Use this to test whether a read operation reached the end of a file (`iostat` value check).

| *STATE*   |||| [__is_iostat_end__]({{site.baseurl}}/learn/intrinsics/IS_IOSTAT_END)        || &#9679; Test for end-of-file value |

---

4. **`is_iostat_eor`** – *Record-Based I/O Check*  
   Similar to above, but detects end-of-record conditions for formatted stream access.

| *STATE*   |||| [__is_iostat_eor__]({{site.baseurl}}/learn/intrinsics/IS_IOSTAT_EOR)        || &#9679; Test for end-of-record value |

---

5. **`move_alloc`** – *Memory Management*  
   Moves allocation from one allocatable variable to another, leaving the source unallocated. Useful for transferring ownership efficiently.

| *STATE*   |||| [__move_alloc__]({{site.baseurl}}/learn/intrinsics/MOVE_ALLOC)              || &#9679; Move allocation from one object to another |

---

6. **`same_type_as`** – *Dynamic Type Introspection*  
   Compares the dynamic types of two polymorphic variables for equality — useful in object-oriented programming.

| *STATE*   |||| [__same_type_as__]({{site.baseurl}}/learn/intrinsics/SAME_TYPE_AS)          || &#9679; Query dynamic types for equality |

---

7. **`extends_type_of`** – *Polymorphism and Inheritance Check*  
   Determines if one type is an extension of another in a type hierarchy — foundational for advanced polymorphic designs.

| *STATE*   |||| [__extends_type_of__]({{site.baseurl}}/learn/intrinsics/EXTENDS_TYPE_OF)    || &#9679; Determine if the dynamic type of A is an extension of the dynamic type of MOLD |

---

###### fortran-lang intrinsic descriptions
