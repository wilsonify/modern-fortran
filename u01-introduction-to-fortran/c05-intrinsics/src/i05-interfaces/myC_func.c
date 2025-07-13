// myC_func.c
#include <stdlib.h>

void myC_func(void **p) {
    float *arr = (float *)malloc(12 * sizeof(float));
    for (int i = 0; i < 12; i++) {
        arr[i] = (float)(i + 1);
    }
    *p = (void *)arr;
}
