# install

## gcc compiler

[gcc install](https://www.mingw-w64.org/downloads/)

```bash
on windows: scoop install mingw
```

## conda

```bash
conda env create -f environment.yml
```

## pip

```bash
pip install -r requirements.txt 
```

## tests

### hello world

```bash
compile: make hello
```

```python
from hi import helloworld
```

### fib

```bash
compile: make fibo
```

```python
from fib import fib
fib(1000)
```

### primes

```bash
compile: make prime
bench:  make bench
clean: make clean_all
```

```python
from primes import primes
primes(100)

```

### shapes - wrap your own cpp code

[wrap your own cpp code](<https://cython.readthedocs.io/en/latest/src/userguide/wrapping_CPlusPlus.html>)

```python
from shapes import rect
x0, y0, x1, y1 = 1, 2, 3, 4
rect_obj = rect.PyRectangle(x0, y0, x1, y1)
print(dir(rect_obj))

rect_obj.get_area()
rect_obj.get_size()
```

## unit testing

```bash
make test
```
