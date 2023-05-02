from setuptools import setup, Extension
from Cython.Build import cythonize
import numpy as np

from setuptools import find_packages



extensions = [
    Extension(
        'test_reduction',
        sources=['src/cython_src/test_reduction.pyx', 'src/_test_reduction.cpp'],
        language='c++',
        extra_compile_args=['-std=c++11', '-fopenmp', '-s', '-ldl', '-lpthread', '-lgomp',  '-rdynamic',  '-lz', '-fPIC'],
        extra_link_args = ['-fopenmp'],
        include_dirs=[np.get_include()],
    ),]

setup(
    name='test_reduction',
    ext_modules=cythonize(extensions),
    zip_safe=False,
)