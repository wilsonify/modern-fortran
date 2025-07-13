---
layout: book
title: Parallel Programming
permalink: /learn/intrinsics/PARALLEL_index
---

# Parallel Programming Intrinsics

These routines support parallel programming using `coarrays` and `coindexed arrays`. The list is ordered from simplest to most complex based on conceptual difficulty and implementation complexity.

---

## 1. Basic Image Information

Understanding which image you're on and how many exist is foundational:

| Category     | Page                                                                 | Description                                     |
|--------------|----------------------------------------------------------------------|-------------------------------------------------|
| COLLECTIVE   | [__num_images__]({{site.baseurl}}/learn/intrinsics/NUM_IMAGES)       | ● Number of images                              |
| COLLECTIVE   | [__this_image__]({{site.baseurl}}/learn/intrinsics/THIS_IMAGE)       | ● Cosubscript index of this image               |
| COLLECTIVE   | [__image_index__]({{site.baseurl}}/learn/intrinsics/IMAGE_INDEX)     | ● Cosubscript to image index conversion         |

---

## 2. Coarray Event and Array Bound Queries

These intrinsics introduce awareness of distributed memory structures and synchronization events:

| Category     | Page                                                                 | Description                                     |
|--------------|----------------------------------------------------------------------|-------------------------------------------------|
| COLLECTIVE   | [__event_query__]({{site.baseurl}}/learn/intrinsics/EVENT_QUERY)     | ● Query whether a coarray event has occurred    |
| COLLECTIVE   | [__co_lbound__]({{site.baseurl}}/learn/intrinsics/CO_LBOUND)         | ● Lower codimension bounds of an array          |
| COLLECTIVE   | [__co_ubound__]({{site.baseurl}}/learn/intrinsics/CO_UBOUND)         | ● Upper codimension bounds of an array          |

---

## 3. Simple Atomic Operations

Atomic read/write operations help maintain consistency across images:

| Category | Page                                                                   | Description                                   |
|----------|------------------------------------------------------------------------|-----------------------------------------------|
| ATOMIC   | [__atomic_define__]({{site.baseurl}}/learn/intrinsics/ATOMIC_DEFINE)   | ● Set a variable atomically                   |
| ATOMIC   | [__atomic_ref__]({{site.baseurl}}/learn/intrinsics/ATOMIC_REF)         | ● Read a variable atomically                  |
| ATOMIC   | [__atomic_add__]({{site.baseurl}}/learn/intrinsics/ATOMIC_ADD)         | ● Atomic add operation                        |

---

## 4. Atomic Fetch-and-Modify

Adds complexity with memory consistency and fetch semantics:

| Category | Page                                                                        | Description                                     |
|----------|-----------------------------------------------------------------------------|-------------------------------------------------|
| ATOMIC   | [__atomic_fetch_add__]({{site.baseurl}}/learn/intrinsics/ATOMIC_FETCH_ADD) | ● Atomic add operation with prior fetch         |
| ATOMIC   | [__atomic_cas__]({{site.baseurl}}/learn/intrinsics/ATOMIC_CAS)             | ● Atomic compare and swap                       |

---

## 5. Atomic Bit Manipulation

Concurrency-safe, low-level bitwise logic operations:

| Category                    | Page                                                                          | Description                                          |
|-----------------------------|-------------------------------------------------------------------------------|------------------------------------------------------|
| ATOMIC:BIT_MANIPULATION     | [__atomic_and__]({{site.baseurl}}/learn/intrinsics/ATOMIC_AND)               | ● Atomic bitwise AND operation                       |
| ATOMIC:BIT_MANIPULATION     | [__atomic_or__]({{site.baseurl}}/learn/intrinsics/ATOMIC_OR)                 | ● Atomic bitwise OR operation                        |
| ATOMIC:BIT_MANIPULATION     | [__atomic_xor__]({{site.baseurl}}/learn/intrinsics/ATOMIC_XOR)               | ● Atomic bitwise XOR operation                       |
| ATOMIC:BIT_MANIPULATION     | [__atomic_fetch_and__]({{site.baseurl}}/learn/intrinsics/ATOMIC_FETCH_AND)   | ● Atomic bitwise AND with prior fetch                |
| ATOMIC:BIT_MANIPULATION     | [__atomic_fetch_or__]({{site.baseurl}}/learn/intrinsics/ATOMIC_FETCH_OR)     | ● Atomic bitwise OR with prior fetch                 |
| ATOMIC:BIT_MANIPULATION     | [__atomic_fetch_xor__]({{site.baseurl}}/learn/intrinsics/ATOMIC_FETCH_XOR)   | ● Atomic bitwise XOR with prior fetch                |

---

## 6. Collective Communication and Reductions

These are the most advanced, involving synchronized communication across multiple images:

| Category   | Page                                                                   | Description                                                   |
|------------|------------------------------------------------------------------------|---------------------------------------------------------------|
| COLLECTIVE | [__co_broadcast__]({{site.baseurl}}/learn/intrinsics/CO_BROADCAST)     | ● Copy a value to all images in the current image set         |
| COLLECTIVE | [__co_sum__]({{site.baseurl}}/learn/intrinsics/CO_SUM)                 | ● Sum of values across the current set of images              |
| COLLECTIVE | [__co_max__]({{site.baseurl}}/learn/intrinsics/CO_MAX)                 | ● Maximum value across the current set of images              |
| COLLECTIVE | [__co_min__]({{site.baseurl}}/learn/intrinsics/CO_MIN)                 | ● Minimum value across the current set of images              |
| COLLECTIVE | [__co_reduce__]({{site.baseurl}}/learn/intrinsics/CO_REDUCE)           | ● General reduction using a user-specified operation          |

---

###### fortran-lang intrinsic descriptions
