class Paint
  attr_accessor :map
  def initialize(map)
    @map = map
  end

  def paint(x,y,color)
    return if @map[y][x] == color
    cells = connected_adjacents(x,y)
    @map[y][x] = color
    cells.each do |point|
      paint(point[:x], point[:y], color)
    end
  end

  def connected_adjacents(x,y)
    result = []
    if y - 1 >= 0 && is_same_color(x,y,x,y-1)
      result << {x: x, y: y-1}
    end
    if y + 1 < @map.size && is_same_color(x,y,x,y+1)
      result << {x: x, y: y+1}
    end
    if x - 1 >= 0 && is_same_color(x,y,x-1,y)
      result << {x: x-1, y: y}
    end
    if x + 1 < @map[0].size && is_same_color(x,y,x+1,y)
      result << {x: x+1, y: y}
    end
    return result
  end

  def is_same_color(x1,y1,x2,y2)
    @map[y1][x1] == @map[y2][x2]
  end
end

map = [
  ['red', 'red', 'white'],
  ['blue', 'red', 'red'],
  ['blue', 'red', 'black']
]

paint = Paint.new(map)
paint.paint(2,1,'yellow')
p paint.map
