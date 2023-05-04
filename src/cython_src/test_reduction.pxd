import cython
import numpy as np
cimport numpy as np
from libcpp.vector cimport vector

cdef extern from "../_test_reduction.hpp":
    double calculate_sum(const double * input, size_t N);
    double calculate_sum_mp(const double * input, size_t N);
    double calculate_sum_sin_mp(const double * input, size_t N);

cdef extern from "../_test_reduction.hh":
    double calculate_sum_cu(double * data_host, size_t length);