def merge(a,b)
  result = Array.new(a.size+b.size)
  i = result.size - 1
  a_i = a.size - 1
  b_i = b.size - 1
  while i >= 0
    if a_i < 0
      result[i] = b[b_i]
      b_i -= 1
    elsif b_i < 0
      result[i] = a[a_i]
      a_i -= 1
    elsif a[a_i] > b[b_i]
      result[i] = a[a_i]
      a_i -= 1
    else
      result[i] = b[b_i]
      b_i -= 1
    end
    i -= 1
  end
  return result
end

def merge_sort(a)
  return a if a == nil || a.size <= 1
  m = a.size / 2
  return merge(merge_sort(a[0..m-1]), merge_sort(a[m..-1]))
end

a = [4,1,6,8, 100, 1]
p merge_sort(a)
