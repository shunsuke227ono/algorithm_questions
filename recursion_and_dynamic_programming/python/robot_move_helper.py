# coding: utf-8

class RobotMoveHelper(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y
        # NOTE: この書き方だと参照コピーしてしまうのでNG!!!
        # row = [None for x in range(x+1)]
        # self.matrix = [row for x in range(y+1)]
        self.matrix = [[None for x in range(x+1)] for y in range(y+1)]
        self.matrix[0][0] = 1
    def number_of_ways(self):
        for r in range(self.y + 1):
            for c in range(self.x + 1):
                if r == 0 and c == 0:
                    continue
                self.matrix[r][c] = 0
                if r-1 >= 0:
                    self.matrix[r][c] += self.matrix[r-1][c]
                if c-1 >= 0:
                    self.matrix[r][c] += self.matrix[r][c-1]
        return self.matrix[self.y][self.x]


def test(x, y):
    robot_move_helper = RobotMoveHelper(x, y)
    n = robot_move_helper.number_of_ways()
    print n

if __name__ == '__main__':
    test(1, 3)
    test(3, 1)
    test(4, 4)
    test(5, 9)
