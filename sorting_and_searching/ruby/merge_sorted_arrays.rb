# Q. 2 sorted array A and B. A has enough available space to append B.
# Write a method to merge B with sorted state.

# 後ろから詰めていくことでメモリを余分に用意せず、またシフトなどの動作なくマージできる。
#


@a_last_i = 6
@b_last_i = 6
@ab_last_i = 13

@a = [1,3,4,8,10,17,18,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
@b = [1,2,4,5,9,12,15]

def set_biggest
  if @a_last_i < 0 && @b_last_i < 0
    fail
  elsif @a_last_i < 0
    biggest = @b[@b_last_i]
    @b_last_i -= 1
  elsif @b_last_i < 0
    biggest = @a[@a_last_i]
    @a_last_i -= 1
  elsif @a[@a_last_i] > @b[@b_last_i]
    biggest = @a[@a_last_i]
    @a_last_i -= 1
  else
    biggest = @b[@b_last_i]
    @b_last_i -= 1
  end

  @a[@ab_last_i] = biggest
  @ab_last_i -= 1
end

while @a_last_i >= 0 || @b_last_i >= 0
  set_biggest
end

p @a
