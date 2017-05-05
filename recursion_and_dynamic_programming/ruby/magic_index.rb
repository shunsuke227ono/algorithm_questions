# 2017/05/04

# 再帰で書くとこんな感じ.

def magic_index(arr, si, ei)
  i = (si+ei)/2
  return i if arr[i] == i
  return -1 if si == ei

  return magic_index(arr, i+1, ei) if arr[i] < i
  return magic_index(arr, si, i-1) if arr[i] > i
end

def solve(arr)
  return magic_index(arr,0,arr.size-1)
end

p solve([-1,3,4,5])
p solve([-1,0,2,4,5,9,19])
p solve([-1,0,1,2,4,5,19])

# 要素が異なる整数でない場合
def magic_index2(arr, si, ei)
  i = (si+ei)/2
  return i if arr[i] == i
  return -1 if si == ei

  unless i > arr[i+1] && i > arr[ei]
    right = magic_index2(arr, i+1, ei)
    return right unless right == -1
  end
  unless i < arr[i-1] && i < arr[si]
    left = magic_index2(arr, si, i-1)
    return left unless left == -1
  end
  
  return -1
end

def solve2(arr)
  return magic_index2(arr,0,arr.size-1)
end

p solve2([-1,-1,2,5])
p solve2([-1,0,1,4,4,9,19])
p solve2([-1,1,1,1,1,2,19])
