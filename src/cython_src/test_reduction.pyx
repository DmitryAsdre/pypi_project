import cython
import numpy as np
cimport numpy as np
from libcpp.vector cimport vector

from test_reduction cimport calculate_sum, calculate_sum_mp, calculate_sum_sin_mp

def calculate_sum_(np.ndarray[np.float64_t, ndim=1, mode='c'] input):
    cdef double * _input = <double *>input.data

    return calculate_sum(_input, input.shape[0])

def calculate_sum_mp_(np.ndarray[np.float64_t, ndim=1, mode='c'] input):
     cdef double * _input = <double *>input.data

     return calculate_sum_mp(_input, input.shape[0])

def calculate_sum_sin_mp_(np.ndarray[np.float64_t, ndim=1, mode='c'] input):
    cdef double * _input = <double *>input.data

    return calculate_sum_sin_mp(_input, input.shape[0])