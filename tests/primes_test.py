""" test primes """
from unittest import TestCase, main


class PrimesTest(TestCase):
    def test_prime(self):
        from primes import primes
        self.assertEqual('foo'.upper(), 'FOO')
        self.assertEqual([2, 3, 5, 7, 11, 13, 17, 19, 23, 29], primes(10))
 
 
if __name__ == '__main__':
    main()