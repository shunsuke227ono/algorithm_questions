# Q. How many ways are there when you go up n steps stairs
# where you can go up 1, 2 or 3 stairs by a step.

@ways = []

def ways(n)
  return 0 if n < 0
  return 1 if n == 0
  @ways[n] ||= ways(n-1) + ways(n-2) + ways(n-3)
  return @ways[n]
end

puts ways(10)
