# Q. MAX 32bits int N, M. Write a method to insert M to N's bits from i-th to j-th.

@i = 2
@j = 6
@n = "100000000000".to_i(2)
@m = "10011".to_i(2)

# まずnのiからj番目を無力化
# そのあとOR

def turn_off(i, j)
  # NOTE: create 111110000011
  a = ~( ( 1 << (j + 1) ) - 1 ) # 111110000000
  b = ( 1 << i ) - 1 # 000000000011
  turn_off_bits = a | b
  @n = @n & turn_off_bits
end

def merge(i)
  merge_bits = @m << i
  @n = @n | merge_bits
end

turn_off(@i, @j)
merge(@i)

puts @n.to_s(2)
