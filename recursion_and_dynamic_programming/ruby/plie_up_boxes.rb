class Box
  attr_accessor :w, :h, :d

  def initialize(w, h, d)
    self.w = w
    self.h = h
    self.d = d
  end

  def can_be_above(box)
    return true if box == nil
    return w < box.w && h < box.h && d < box.d
  end
end

class PileUpBoxesService
  def initialize
    @dp = {}
  end

  def height(boxes, bottom)
    return @dp[bottom] if @dp[bottom] != nil

    max_height = 0
    boxes.each do |box|
      if box.can_be_above(bottom)
        max_height = [height(boxes, box), max_height].max
      end
    end

    return @dp[bottom] = max_height + bottom.h if bottom != nil
    return @dp[bottom] = max_height
  end
end

inputs = []
while str = STDIN.gets
  break if str.chomp == "exit"
  inputs << str.chomp.split(' ').map(&:to_i)
end

boxes = inputs.map { |input| Box.new(input[0], input[1], input[2])}
pile_up_boxes_service = PileUpBoxesService.new
puts pile_up_boxes_service.height(boxes, nil)
