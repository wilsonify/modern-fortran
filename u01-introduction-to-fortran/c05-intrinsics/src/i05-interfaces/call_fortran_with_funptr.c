#include <stdio.h>
#include <math.h>

typedef void (*fptr_t)(float*);

void call_fortran_with_funptr(fptr_t p) {
    float x = 9.0;
    printf("C: before Fortran, x = %f\n", x);
    p(&x);
    printf("C: after Fortran, x = %f\n", x);
}
