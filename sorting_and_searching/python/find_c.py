def find_c(l, c):
    res_c = find_recursively(l, c, 0, len(l)-1)
    return res_c

def find_recursively(l, c, s, e):
    if s > e:
        return None
    m = (s + e) / 2
    if l[m] == c:
        return m
    elif l[m] == ' ':
        left_res = find_recursively(l, c, s, m-1)
        right_res = find_recursively(l, c, m+1, e)
        if left_res != None:
            return left_res
        if right_res != None:
            return right_res
        return None
    elif ord(c) < ord(l[m]):
        left_res = find_recursively(l, c, s, m-1)
        return left_res
    else:
        right_res = find_recursively(l, c, m+1, e)
        return right_res

def test():
    print find_c(['a', ' ', ' ', 'd', 'k', 'm', ' ', 'p', 't', ' '], 'c')
    print find_c(['a', ' ', ' ', 'd', 'k', 'm', ' ', 'p', 't', ' '], 't')
    print find_c(['a', ' ', ' ', 'd', 'k', 'm', ' ', 'p', 't', ' '], 'x')

if __name__ == '__main__':
    test()
