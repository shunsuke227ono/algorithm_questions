import code

def sub_groups(group):
    res = [[]]
    for g in  group:
        current_length = len(res)
        for r_i in range(current_length):
            new_r = res[r_i][:]
            new_r.append(g)
            res.append(new_r)
    return res

def test():
    res = sub_groups([1,2,3,4])
    print res

if __name__ == '__main__':
    test()
