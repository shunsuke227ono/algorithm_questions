class Disc
  attr_accessor :v
  def initialize(v)
    @v = v
  end
  def can_be_above?(disc)
    v < disc.v
  end
end

class Tower
  attr_accessor :i, :discs
  def initialize(i)
    @i = i
    @discs = []
  end

  def push(disc)
    if @discs.size == 0 || disc.can_be_above?(@discs[-1])
      @discs.push(disc)
    else
      raise "invalid disc"
    end
  end

  def pop
    @discs.pop
  end
end

class Hanoi
  def initialize
    @source = Tower.new(1)
    @buffer = Tower.new(2)
    @dest = Tower.new(3)

    @source.push(Disc.new(4))
    @source.push(Disc.new(3))
    @source.push(Disc.new(2))
    @source.push(Disc.new(1))
  end

  def move
    move_discs(@source, @buffer, @dest, @source.discs.size)
  end

  def move_discs(source, buffer, dest, n)
    if n == 1
      disc = source.pop
      dest.push(disc)
      p "move #{disc.v} from #{source.i} to #{dest.i}"
      return
    end

    move_discs(source, dest, buffer, n-1)
    move_discs(source, buffer, dest, 1)
    move_discs(buffer, source, dest, n-1)
  end
end

hanoi = Hanoi.new
hanoi.move
