#ifndef _POLYNOMIALS
#define _POLYNOMIALS
#include <stdbool.h>

typedef struct POLYNOMIAL polynomial;
polynomial *create_polynomial(int length, int *coefficients);
void delete_polynomial(polynomial * p);
void print_polynomial(polynomial * p, bool beauty_print);
int evaluate_polynomial(polynomial * p, float x);
bool equality_polynomial(polynomial * p1, polynomial * p2);
polynomial *max_polynomial(polynomial * p1, polynomial * p2);
polynomial *derive_polynomial(polynomial * p);
polynomial *sum_polynomial(polynomial * p1, polynomial * p2);
polynomial *multiply_polynomial(polynomial * p1, polynomial * p2);
#endif
