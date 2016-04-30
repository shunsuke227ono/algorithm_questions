# - 最小リストから3,5,7のどれかをかけたものかつ、すでに存在しないもの: O(n^2)
# - 次に追加するリストを用意してリストから最小のものを(全て)毎回取り出す。: 取り出しO(n)、追加O(1)
#   - リスト用意において、工夫して、重複を削り、素数ごとにわけると: 取り出しO(1), 追加O(n)
#   - => さらに工夫して重複削る規則性を見ることで、追加O(1)

require 'thread'

class NthSmallestService
  def initialize
    @q3 = Queue.new
    @q3_top = 3
    @q5 = Queue.new
    @q5_top = 5
    @q7 = Queue.new
    @q7_top = 7
    @mins = [1]
  end

  def find_nth(n)
    (n-1).times do |i|
      pop_new_min
    end
    p @mins
    @mins[n-1]
  end

  def pop_new_min
    if @q3_top && @q3_top < @q5_top && @q3_top < @q7_top
      @mins << @q3_top
      @q3.push(@q3_top * 3)
      @q5.push(@q3_top * 5)
      @q7.push(@q3_top * 7)
      unless @q3.empty?
        @q3_top = @q3.pop
      else
        @q3_top = nil
      end
    elsif @q5_top && @q5_top < @q3_top && @q5_top < @q7_top
      @mins << @q5_top
      @q5.push(@q5_top * 5)
      @q7.push(@q5_top * 7)
      unless @q5.empty?
        @q5_top = @q5.pop
      else
        @q5_top = nil
      end
    else
      @mins << @q7_top
      @q7.push(@q7_top * 7)
      @q7_top = @q7.pop unless @q7.empty?
    end
  end
end

def do_test(n)
  nth_smallest_service = NthSmallestService.new
  nth_smallest_service.find_nth(n)
end

while str = STDIN.gets
  break if str.chomp == "exit"
  n = str.chomp.to_i
end

puts do_test(n)
