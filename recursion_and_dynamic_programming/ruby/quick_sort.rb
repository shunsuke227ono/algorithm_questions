def devide(a,s,e)
  if e <= s
    return
  end

  p_n = a[e]
  p_i = 0
  (s...e).each do |i|
    if a[i] < p_n
      swap(a, i, p_i)
      p_i += 1
    end
  end
  swap(a,e,p_i)
  devide(a,0,p_i-1)
  devide(a,p_i+1,e)
end

def quick_sort(a)
  devide(a,0,a.size-1)
end

def swap(a,i,k)
  tmp = a[i]
  a[i] = a[k]
  a[k] = tmp
end

a = [4,1,6,2,5]
quick_sort(a)
p a
