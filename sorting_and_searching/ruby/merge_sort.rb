# 2017/05/04
# 普通のマージソートの実装

# inplaceで
def merge_sort(arr,si,ei)
  return if si == ei
  mi = (si+ei)/2
  merge_sort(arr,si,mi)
  merge_sort(arr,mi+1,ei)
  merge(arr,si,mi,ei)
end

def merge(arr,si,mi,ei)
  left_copy = []
  (si..mi).each { |i| left_copy << i }

  left_i = si # leftの中での最先端のポインタ
  right_i = mi+1 # rightの中での最先端のポインタ
  curr_i = si # 挿入する上でのポインタ

  while curr_i <= ei
    if left_i <= mi && right_i <= ei
      l = left_copy[left_i-si] # inplaceで置き換えて行くのでleftはcopyから参照
      r = arr[right_i]
      if l < r
        arr[curr_i] = l
        left_i += 1
      else
        arr[curr_i] = r
        right_i += 1
      end
    elsif left_i <= mi
      arr[curr_i] = left_copy[left_i-si]
      left_i += 1
    elsif right_i <= ei
      arr[curr_i] = arr[right_i]
      right_i += 1
    end
    curr_i += 1
  end
end

a = [2,1,3,4,1,5,6]
merge_sort(a,0,a.size-1)
p a
b = [2,1,3,4,1,5,6,2]
merge_sort(b,0,b.size-1)
p b
c = [2]
merge_sort(c,0,c.size-1)
p c
