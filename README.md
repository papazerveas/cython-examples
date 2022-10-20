# install

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
import hi

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

## unit testing

```bash
make test
```