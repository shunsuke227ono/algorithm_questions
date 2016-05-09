class Node(object):
    def __init__(self, right=None, left=None):
        self.right = right
        self.left = left
    def set_parent(self, parent):
        self.parent = parent
    def next(self):
        if self.right != None:
            # TODO: 右のsubtreeで一番左のものを返す
            current_node = self.right
            while current_node.left != None:
                current_node = current_node.left
            return current_node
        else:
            current_node = self
            while current_node.parent != None:
                if parent.left == self:
                    return parent
                else:
                    current_node = current_node.parent
            return None
