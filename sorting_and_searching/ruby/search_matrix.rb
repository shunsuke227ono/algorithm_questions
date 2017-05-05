# 2017/05/05
# 行と列がソートされた行列における探索

# 再帰の時の+/-がうまくいってないのでstack too deepになる.

def find(matrix, t, sx, sy, ex, ey)
  return [-1, -1] if [sx, sy, ex, ey].min < 0
  return [-1, -1] if [sx, ex].max >= matrix[0].size
  return [-1, -1] if [sy, ey].max >= matrix.size
  return [-1, -1] if sx > ex || sy > ey
  mx = (sx+ex)/2
  my = (sy+ey)/2
  return [mx,my] if matrix[my][mx] == t
  return [-1, -1] if sx >= ex && sy >= ey

  if matrix[my][mx] > t
    new_ex = mx-1
    new_ey = my-1
    left_top = find(matrix, t, sx, sy, new_ex, new_ey)
    return left_top if left_top != [-1,-1]

    new_ex = mx-1
    left_bottom = find(matrix, t, sx, my, new_ex, ey)
    return left_bottom if left_bottom != [-1,-1]

    new_ey = my-1
    right_top = find(matrix, t, mx, sy, ex, new_ey)
    return right_top if right_top != [-1,-1]
  else
    new_sx = mx+1
    new_sy = my+1
    right_bottom = find(matrix, t, new_sx, new_sy, ex, ey)
    return right_bottom if right_bottom != [-1,-1]

    new_sy = my+1
    left_bottom = find(matrix, t, sx, new_sy, mx, ey)
    return left_bottom if left_bottom != [-1,-1]

    new_sx = mx+1
    right_top = find(matrix, t, new_sx, sy, ex, my)
    return right_top if right_top != [-1,-1]
  end
  return [-1,-1]
end

a = [
  [0,1,2,3,4],
  [2,4,5,6,7],
  [4,6,8,9,20],
  [5,16,18,19,23],
  [6,19,22,34,55],
  [18,29,39,45,58],
]

a.each do |row|
  row.each do |e|
    p '==='
    p e
    p find(a, e, 0, 0, a[0].size-1, a.size-1)
  end
end

# p find(a, 22, 0, 0, a[0].size-1, a.size-1)
# p find(a, 6, 0, 0, a[0].size-1, a.size-1)
# p find(a, 7, 0, 0, a[0].size-1, a.size-1)
# p find(a, 0, 0, 0, a[0].size-1, a.size-1)
# p find(a, 18, 0, 0, a[0].size-1, a.size-1)
# p find(a, 19, 0, 0, a[0].size-1, a.size-1)
