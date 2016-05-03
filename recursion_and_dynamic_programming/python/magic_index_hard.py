def magic_index(array, s=None, e=None):
    if s > e:
        return
    if s == None:
        s = 0
    if e == None:
        e = len(array) - 1
    if s == e:
        if array[s] == s:
            print s
    else:
        m = (s+e)/2
        if array[m] == m:
            if m != e:
                magic_index(array, s, m)
            if array[m]+1 != s:
                magic_index(array, array[m]+1, e)
        if array[m] > m:
            if m != e:
                magic_index(array, s, m)
            if array[m] != s:
                magic_index(array, array[m], e)
        if array[m] < m:
            if m-1 != s:
                magic_index(array, m-1, e)
            if array[m] != e:
                magic_index(array, s, array[m])
def test():
    print 'case1:'
    magic_index([0,3,3,3])
    print 'case2:'
    magic_index([0,2,2,8])
    print 'case3:'
    magic_index([1,2,3,4])
    print 'case4:'
    magic_index([0,3,5,7])

if __name__ == '__main__':
    test()
