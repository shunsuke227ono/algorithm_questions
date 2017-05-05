def bst(arr,si,ei,t)
  mi = (si+ei)/2
  if arr[mi] == t
    return mi
  end
  if si == ei
    return -1
  end

  if t > arr[mi]
    return bst(arr,mi+1,ei,t)
  elsif t < arr[mi]
    return bst(arr,si,mi,t)
  end
end

a = [0,3,4,5,6,19,94,593,59959]
p bst(a,0,a.size-1,4)
p bst(a,0,a.size-1,593)

def bst_loop(arr,t)
  si = 0
  ei = arr.size - 1

  while si <= ei
    mi = (si+ei)/2
    return mi if arr[mi] == t
    return -1 if si == ei

    if t > arr[mi]
      si = mi+1
    else
      ei = mi
    end
  end
end

a = [0,3,4,5,6,19,94,593,59959]
p bst_loop(a,4)
p bst_loop(a,593)
