#ifndef TEST_REDUCTION
#define TEST_REDUCTION

#include <vector>
#include <cstddef>


double calculate_sum(const double * data, size_t N);
double calculate_sum_mp(const double * data, size_t N);
double calculate_sum_sin_mp(const double * data, size_t N);

#endif 