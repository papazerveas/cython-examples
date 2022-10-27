""" test shape """
from unittest import TestCase, main


class ShapesTest(TestCase):
    def test_PyRectangle(self):
        from shapes import rect
        rect_obj = rect.PyRectangle(1, 2, 3, 4)
        self.assertEqual(4, rect_obj.get_area())
        self.assertEqual((2,2), rect_obj.get_size())
        self.assertEqual(1, rect_obj.x0)
        self.assertEqual(2, rect_obj.y0)
        self.assertEqual(3, rect_obj.x1)
        self.assertEqual(4, rect_obj.y1)
        
        rect_obj.move(1,3)
        self.assertEqual(1+1, rect_obj.x0)
        self.assertEqual(2+3, rect_obj.y0)
        self.assertEqual(3+1, rect_obj.x1)
        self.assertEqual(4+3, rect_obj.y1)
        self.assertEqual(4, rect_obj.get_area())
        self.assertEqual((2,2), rect_obj.get_size())
 
if __name__ == '__main__':
    main()