import cython
import numpy as np
cimport numpy as np
from libcpp.vector cimport vector

from test_reduction cimport calculate_sum

def calculate_sum_(np.ndarray[np.float64_t, ndim=1, mode='c'] input):
    cdef double * _input = <double *>input.data
         #size_t size = input.shape[0]

    return calculate_sum(_input, input.shape[0])