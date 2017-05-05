require 'pry'

# dp x loop
def ways(x, y, banned_spots)
  @dp = []
  (y+1).times do
    @dp << Array.new(x+1, 0)
  end

  (y+1).times do |yi|
    (x+1).times do |xi|
      if banned_spots.include?([xi, yi])
        @dp[yi][xi] = 0
      elsif yi == 0 || xi == 0
        @dp[yi][xi] = 1
      else
        @dp[yi][xi] = @dp[yi-1][xi] + @dp[yi][xi-1]
      end
    end
  end
  return @dp[y][x]
end

#
#
#

# dp x recursion
def ways2(tx,ty,fx,fy,banned_spots)
  if banned_spots.include?([fx,fy])
    return 0
  end

  if tx == fx || ty == fy
    return 1
  end

  return @dp2[fy][fx] if @dp2[fy][fx] > 0

  res = 0
  if fx < tx
    res += ways2(tx, ty, fx+1, fy, banned_spots)
  end
  if fy < ty
    res += ways2(tx, ty, fx, fy+1, banned_spots)
  end

  @dp2[fy][fx] = res
  return res
end

def call_ways2(x,y,banned_spots)
  @dp2 = []
  (y+1).times do
    @dp2 << Array.new(x+1, 0)
  end
  ways2(x,y,0,0,banned_spots)
end

p ways(3, 3, [[1,1],[2,1]])
p ways(4, 3, [[1,1],[2,1]])
p call_ways2(3, 2, [[1,1],[2,1]])
p call_ways2(4, 4, [[1,1],[2,1]])
