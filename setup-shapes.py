from setuptools import setup, Extension
from Cython.Build import cythonize

setup(ext_modules = cythonize(Extension(
           "shapes.rect",                                # the extension name
           sources=["shapes/rect.pyx" ], # the Cython source and
      )))