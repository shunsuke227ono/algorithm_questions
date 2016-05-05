from IPython import embed

def execute(array, n):
    if len(array) < 1:
        raise Exception
    i = find_n(array, n, 0, len(array)-1)
    print i

def find_n(array, n, s, e):
    if s > e:
        return None
    m = (s + e) / 2
    if array[m] == n:
        return m
    if is_sorted(array, s, m-1):
        if has_n(array, n, s, m-1):
            return bst(array, n, s, m-1)
        else:
            return find_n(array, n, m+1, e)
    if is_sorted(array, m+1, e):
        if has_n(array, n, m+1, e):
            return bst(array, n, m+1, e)
        else:
            return find_n(array, n, s, m-1)

def bst(array, n, s, e):
    if s > e:
        return None
    m = (s + e) / 2
    if array[m] == n:
        return m
    if array[m] < n:
        return bst(array, n, m+1, e)
    else:
        return bst(array, n, s, m-1)

def is_sorted(array, s, e):
    if s > e:
        return False
    if s == e:
        return True
    return array[s] < array[e]

def has_n(array, n, s, e):
    if not is_sorted(array, s, e):
        raise Exception
    if array[s] <= n and n <= array[e]:
        return True
    else:
        return False

def test():
    execute([10,15,20,0,5], 5)
    execute([10,15,20,0,5], 0)
    execute([10,15,20,0,5], 20)
    execute([10,15,20,0,5], 15)
    execute([10,15,20,0,5], 10)
    execute([10,15,20,0,5], 18)
    
if __name__ == "__main__":
    test()
