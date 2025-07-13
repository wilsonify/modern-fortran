#include <math.h>

float square(float x) {
    return x * x;
}

// Return function pointer as void*
void* getIterFunc(void) {
    return (void*)&square;
}
