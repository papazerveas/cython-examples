from setuptools import setup, Extension
from Cython.Build import cythonize
import os

# pyx files
modules = [Extension(name,
                         [os.path.join(name.replace('.', '/') ) + '.pyx'] )
               for name in [
        'primes.primes',
        'primes.primes_c1',
        'primes.primes_c2'
        
    ]]

# py files    
modules.extend([Extension(name,
                         [os.path.join(name.replace('.', '/') ) + '.py'] )
               for name in [
        'primes.primes_python',
        'primes.primes_python_compiled'
        
    ]])


setup(
    ext_modules= cythonize( modules  ,   
        annotate=False),                 # enables generation of the html annotation file
)
