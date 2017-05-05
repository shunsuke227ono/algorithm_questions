# 2017/05/04

@dp = []

def steps(n)
  return 0 if n < 0
  return 1 if n == 0

  @dp[n] ||= steps(n-1) + steps(n-2) + steps(n-3)
  return @dp[n]
end

p steps(0)
p steps(1)
p steps(2)
p steps(4)
p steps(7)
