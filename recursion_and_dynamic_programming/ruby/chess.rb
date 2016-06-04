class Chess
  CHESS_SIZE = 8

  def initialize
    @result = []
  end

  def execute
    ways(0, Array.new(8))
    @result
  end

  def ways(r_i, way)
    if r_i == CHESS_SIZE
      @result << way
    end
    CHESS_SIZE.times do |c_i|
      if putable(way, r_i, c_i)
        new_way = way.dup
        new_way[r_i] = c_i
        ways(r_i + 1, new_way)
      end
    end
  end

  def putable(way, r_i, c_i)
    r_i.times do |r|
      return false if way[r] == c_i
      return false if (way[r] - c_i).abs == (r_i - r).abs
    end
    return true
  end
end

chess = Chess.new
p chess.execute
