#include <cstddef>

#include "_test_reduction.hpp"


double calculate_sum(const double * input, size_t size){
    double sum(0);
    for(size_t i = 0; i < size; i++){
        sum += input[i];
    }
    return sum;
}