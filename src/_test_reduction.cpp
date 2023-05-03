#include <cstddef>
#include <cmath>

#include "_test_reduction.hpp"


double calculate_sum(const double * input, size_t size){
    double sum(0);
    for(size_t i = 0; i < size; i++){
        sum += input[i];
    }
    return sum;
}

double calculate_sum_sin_mp(const double * input, size_t size){
    double sum(0);
    #pragma omp parallel for reduction(+ : sum)
        for(size_t i = 0; i < size; i++){
            for(size_t j = 0; j < size; j++)
                sum += sin(input[i]) + cos(input[j]);
        }
    return sum;
}

double calculate_sum_mp(const double * input, size_t size){
    double sum(0);
    #pragma omp parallel for reduction(+ : sum)
        for(size_t i = 0; i < size; i++){
            sum += input[i];
        }
    return sum;
}

