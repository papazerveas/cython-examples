GIT_BRANCH ?= master

hello:
	- python setup-hello.py build_ext --inplace --compiler=mingw32

fibo:
	- python setup-fib.py build_ext --inplace

shape:
	- python setup-shapes.py build_ext --inplace

prime:
	- python setup-primes.py build_ext
	# - $(MAKE) bench
	# - $(MAKE) clean_all


pre_test_build:
	- $(MAKE) prime
	- $(MAKE) shape

test:
	- python -m unittest discover tests -p '*_test.py'

bench:
	- python -m timeit -s "from primes import primes;" "primes(1000)" 
	- python -m timeit -s "from primes.primes_python import primes;" "primes(1000)" 
	- python -m timeit -s "from primes.primes_python_compiled import primes;" "primes(1000)" 
	- python -m timeit -s "from primes.primes_c1 import primes;" "primes(1000)" 
	- python -m timeit -s "from primes.primes_c2 import primes;" "primes(1000)" 


.PHONY: clean_all
clean_all: clean  clean_pyd clean_pyc clean_c clean_cpp


.PHONY: clean
clean: 
	-python setup.py clean
	-rm -rf rz.egg-info/ build/


.PHONY: clean_pyc
clean_pyc:
	- python -Bc "import pathlib; [p.unlink() for p in pathlib.Path('.').rglob('*.py[co]')]"
	- python -Bc "import pathlib; [p.rmdir() for p in pathlib.Path('.').rglob('__pycache__')]"
	# - find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf
	# - find . -name '*.py[co]' -exec rm {} \;

.PHONY: clean_pyd
clean_pyd:
	- python -Bc "import pathlib; [p.unlink() for p in pathlib.Path('.').rglob('*.pyd')]"
	# - find . -name '*.pyd' -exec rm {} \;


.PHONY: clean_c
clean_c:
	- python -Bc "import pathlib; [p.unlink() for p in pathlib.Path('.').rglob('*.c')]"

.PHONY: clean_cpp
clean_cpp:
	- python -Bc "import pathlib; [p.unlink() for p in pathlib.Path('.').rglob('*.cpp') if not p.name.__eq__('Rectangle.cpp') ]"
	# - find . -name '*.cpp' -exec rm {} \;


git:
	- git checkout $(GIT_BRANCH)
	- git add -A .
	- git commit -m "$(msg)"
	- git push -u  origin $(GIT_BRANCH)

gitamend:
	- git checkout $(GIT_BRANCH)
	- git add -A .
	- git commit --amend --no-edit
	- git push origin $(GIT_BRANCH) --force