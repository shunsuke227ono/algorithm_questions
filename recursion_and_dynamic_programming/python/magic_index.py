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
        if array[m] >= m:
            magic_index(array, s, m)
        if array[m] <= m:
            magic_index(array, m+1, e)

def test():
    print 'case1:'
    magic_index([0,1,2,3])
    # print 'case2:'
    # magic_index([0,1,4,8])
    # print 'case3:'
    # magic_index([1,2,3,4])
    # print 'case4:'
    # magic_index([0,3,5,7])

if __name__ == '__main__':
    test()
