class LinkedNode(object):
    def __init__(self, data):
        self.data = data
        self.next = None
    def __str__(self):
        return self.data

class LinkedList(object):
    def __init__(self, node):
        self.head = node
        self.tail = node
    def append(self, node):
        self.tail.next = node
        self.tail = node
    def __str__(self):
        n = self.head
        res = []
        while n != None:
            res.append(n.data)
            n = n.next
        return str(res)

def sum_up(l_a, l_b):
    res = None
    n_a = l_a.head
    n_b = l_b.head
    c = 0
    while n_a != None or n_b != None or c != 0:
        s = c
        if n_a != None:
            s += n_a.data
            n_a = n_a.next
        if n_b != None:
            s += n_b.data
            n_b = n_b.next
        if s >= 10:
            c = 1
        else:
            c = 0
        if res == None:
            res = LinkedList(LinkedNode(s % 10))
        else:
            res.append(LinkedNode(s % 10))
    return res

def test():
    l_a = LinkedList(LinkedNode(7))
    l_a.append(LinkedNode(5))
    l_a.append(LinkedNode(9))
    print l_a
    l_b = LinkedList(LinkedNode(3))
    l_b.append(LinkedNode(8))
    l_b.append(LinkedNode(3))
    l_b.append(LinkedNode(9))
    print l_b
    res = sum_up(l_a, l_b)
    print res

if __name__ == '__main__':
    test()
