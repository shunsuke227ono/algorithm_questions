class Node(object):
    def __init__(self, data, left=None, right=None):
        self.data = data
        self.right = right
        self.left = left
        self.parent = None
    def set_parent(self, parent):
        self.parent = parent
    def next(self):
        if self.right != None:
            current_node = self.right
            while current_node.left != None:
                current_node = current_node.left
            return current_node.data
        else:
            current_node = self
            while current_node.parent != None:
                if current_node.parent.left == current_node:
                    return current_node.parent.data
                else:
                    current_node = current_node.parent
            return None

#
#    7
#  5   6
# 1 2 3 4
#

def test():
    leaf_1 = Node(1)
    leaf_2 = Node(2)
    leaf_3 = Node(3)
    leaf_4 = Node(4)
    middle_5 = Node(5, leaf_1, leaf_2)
    middle_6 = Node(6, leaf_3, leaf_4)
    root = Node(7, middle_5, middle_6)

    middle_5.set_parent(root)
    middle_6.set_parent(root)

    leaf_1.set_parent(middle_5)
    leaf_2.set_parent(middle_5)
    leaf_3.set_parent(middle_6)
    leaf_4.set_parent(middle_6)

    res_1 = leaf_1.next()
    print res_1
    res_2 = leaf_2.next()
    print res_2
    res_3 = leaf_3.next()
    print res_3
    res_4 = leaf_4.next()
    print res_4
    res_5 = middle_5.next()
    print res_5
    res_6 = middle_6.next()
    print res_6
    res_7 = root.next()
    print res_7

if __name__ == '__main__':
    test()
