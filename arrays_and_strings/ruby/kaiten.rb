require 'pry'
class Matrix
  attr_accessor :map
  def initialize(map)
    @map = map
  end

  def kaiten
    y = 0
    while y <= @map.size - 2 - y
      x_s = y
      x_e = @map.size - 2 - y
      (x_s..x_e).each do |x|
        replace(y,x)
      end
      y += 1
    end
  end

  def replace(x,y)
    top = @map[y][x]
    right = dest(x,y)
    bottom = dest(right[:x],right[:y])
    left = dest(bottom[:x],bottom[:y])
    # binding.pry
    @map[y][x] = val(left)
    @map[left[:y]][left[:x]] = val(bottom)
    @map[bottom[:y]][bottom[:x]] = val(right)
    @map[right[:y]][right[:x]] = top
  end

  def val(hash)
    # binding.pry
    @map[hash[:y]][hash[:x]]
  end

  def dest(x,y)
    {x: @map.size - y - 1, y: x}
  end
end

def p_map(map)
  map.each { |row| p row }
end

map = [
  [1,2,3,4],
  [5,6,7,8],
  [1,2,3,4],
  [1,2,3,4],
]

matrix = Matrix.new(map)
matrix.kaiten
p_map matrix.map
