"""
@author: Yogeshwar
@Goal: To Demonstrate 'is a' relationship using quadrilateral and square example
"""

import sys


class Quadrilateral:
    def __init__(self, a:float, b:float, c:float, d:float):
        """
        :param a: side 1 of quadrilateral
        :param b: side 2 of quadrilateral
        :param c: side 3 of quadrilateral
        :param d: side 4 of quadrilateral
        """
        acceptable_types = [int, float]
        if (type(a) not in acceptable_types or type(b) not in acceptable_types
            or type(c) not in acceptable_types or type(d) not in acceptable_types):
            print("Bad type for sides of quadrilateral")
            sys.exit(-1)

        if a + b + c < d or b + c + d < a or a + b + d < c or a + c + d < b:
            print("Bad value for sides of quadrilateral")
            sys.exit(-1)

        self.a = a
        self.b = b
        self.c = c
        self.d = d

    def area(self) -> float:
        """
        :return: Area of calling object
        """
        s = self.perimeter() / 2
        return ((s - self.a) * (s - self.b) * (s - self.c) * (s - self.d)) ** 0.5

    def perimeter(self) -> float:
        """
        :return: Perimeter of calling object
        """
        print("type(self):", type(self))
        print("self.__dict__:", self.__dict__)
        return self.a + self.b + self.c + self.d



class Square(Quadrilateral):
    def __init__(self, side):
        print("1] Square.__init__:type(self):", type(self))
        self.side = side
        print("2] BEFORE: Square.__init__:self.__dict__:", self.__dict__)
        Quadrilateral.__init__(self, side, side, side, side)
        print("3] AFTER: Square.__init__:self.__dict__:", self.__dict__)


S = Square(10)
S.perimeter() # Quadrilateral.perimeter(S)
S.area()