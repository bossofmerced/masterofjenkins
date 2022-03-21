#!/usr/bin/env python3 

from Hello import run_code
import unittest

class TestHello(unittest.TestCase):

    def test_type(self):
        """
        Tests whether the output is correct type
        """

        self.assertTrue(type(run_code()) is str)

    def test_output(self):
        """
        Tests whether the output is returning correct value
        """

        self.assertEqual(run_code(), 'Hello World!')


if __name__ == '__main__':
    unittest.main()
