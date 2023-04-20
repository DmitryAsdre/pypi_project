from setuptools import setup, Extension
from Cython.Build import cythonize
import numpy as np

extensions = [
    Extension(
        'test_reduction',
        sources=['src/cython_src/test_reduction.pyx'],
        language='c++',
        extra_compile_args=['-std=c++11', '-fopenmp', '-lpthread', '-lgomp'],
        include_dirs=[np.get_include()]
        #libraries=['CarsClassificationNetLib',  'ncnn'],
        #library_dirs=[os.path.abspath('./build'), 'src/ncnn/build/install/lib'],
        #include_dirs=[os.path.abspath('./include'), 'src/ncnn/build/install/include/ncnn',
        #                                            np.get_include()] + opencv_incs,
        #extra_link_args=opencv_libs,
        #runtime_library_dirs = ['/usr/local/lib', '/usr/lib/']
    ),]

setup(
    name='test_reduction',
    ext_modules=cythonize(extensions),
    zip_safe=False,
)