# Q. Each node has value. Write algorithm to find all paths whose sum
# is equal to given value. One node need be ancestor of the other.

class Node
  attr_accessor :value, :left, :right

  def initialize(value, left=nil, right=nil)
    self.value = value
    self.left = left
    self.right = right
  end
end

class FindSumService
  def initialize(root, sum)
    @root = root
    @sum = sum
  end

  def execute
    path = Array.new(depth(@root), nil)
    find_sum(@root, path, 0)
  end

  private

  # NOTE: levelでアクセスするところ選ばないと、配列自体は更新され続けてしまうので上手くいかない。
  def find_sum(current_node, path, level)
    return if current_node.nil? # 終了条件

    path[level] = current_node.value

    find_ans_paths(path, level) # path内で条件にあう組み合わせ探す

    find_sum(current_node.left, path, level+1)
    find_sum(current_node.right, path, level+1)

    path[level] = nil # メモリ整理
  end

  def find_ans_paths(path, level)
    temp_sum = 0
    (0..level).each do |i|
      start_index = level - i
      temp_sum += path[start_index]
      print_path(path, start_index, level) if temp_sum == @sum
    end
  end

  def print_path(path, start_index, level)
    p "Path with sum of #{@sum}: #{path[start_index..level]}"
  end

  def depth(node)
    return 0 if node.nil?
    return 1 + [depth(node.left), depth(node.right)].max
  end
end

def test_root
  #
  # 3
  # 6           4
  # 10    13    9     15
  # 1  6  9  14 3 1   7  8
  # 4  7  8     3     9
  Node.new(3,
    Node.new(6,
      Node.new(10, Node.new(1, Node.new(4)), Node.new(6, nil, Node.new(7))),
      Node.new(13, Node.new(9, Node.new(8)), Node.new(14))
    ),
    Node.new(4,
      Node.new(9, Node.new(3, Node.new(3)), Node.new(1)),
      Node.new(15, Node.new(7, Node.new(9)), Node.new(8))
    )
  )
end

find_sum_service = FindSumService.new(test_root, 22)
find_sum_service.execute
