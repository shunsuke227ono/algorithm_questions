# 2017/05/03

class Box
  attr_accessor :w, :h, :d, :above_box
  def initialize(w,h,d)
    @w = w
    @h = h
    @d = d
  end
  def can_be_above(box)
    w < box.w && h < box.h && d < box.d
  end
end

@dp = {}
def height(boxes, bottom)
  return @dp[bottom] if @dp[bottom]

  max_height = 0
  boxes.each do |box|
    if box.can_be_above(bottom)
      if bottom.h + height(boxes, box) > max_height
        max_height = bottom.h + height(boxes, box)
        bottom.above_box = box
      end
    end
  end
  return @dp[bottom] = max_height
end

@bottom = nil
def max_height(boxes)
  max_height = 0
  boxes.each do |box|
    if height(boxes, box) > max_height
      max_height = height(boxes, box)
      @bottom = box
    end
  end
  return max_height
end

b1 = Box.new(3,3,3)
b2 = Box.new(1,1,1)
b3 = Box.new(2,2,2)
b4 = Box.new(4,4,4)
b5 = Box.new(5,5,5)

max_height([b1,b2,b3,b4,b5])

box = @bottom
while box
  print box.h
  box = box.above_box
end
