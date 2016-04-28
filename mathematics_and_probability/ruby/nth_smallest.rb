# - 最小リストから3,5,7のどれかをかけたものかつ、すでに存在しないもの: O(n^2)
# - 次に追加するリストを用意してリストから最小のものを(全て)毎回取り出す。: 取り出しO(n)、追加O(1)
#   - リスト用意において、工夫して、重複を削り、素数ごとにわけると: 取り出しO(1), 追加O(n)
#   - => さらに工夫して重複削る規則性を見ることで、追加O(1)

require 'thread'

class NthSmallestService
  def initialize
    @q3 = Queue.new
    @q5 = Queue.new
    @q7 = Queue.new
    @mins = []
  end

  def find_nth(n)
  end

  def pop_new_min
    # pop_new_min from the queue
    # set new candidates
    if Q
  end
end
