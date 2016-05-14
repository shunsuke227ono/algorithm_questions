class Node
  attr_accessor :data, :left, :right, :visited

  def initialize(data, left=nil, right=nil)
    self.data = data
    self.left = left
    self.right = right
    self.visited = false
  end

  def has_unvisited_left?
    left && !left.visited
  end

  def has_unvisited_right?
    right && !right.visited
  end
end

class BinaryTree
  def initialize(root)
    @root = root
    @current_n = nil
  end

  def is_bst?(node=@root)
    if node.has_unvisited_left?
      return false unless is_bst?(node.left)
    end

    return false unless is_increasing?(node)
    visit(node)

    if node.has_unvisited_right?
      return false unless is_bst?(node.right)
    end

    return true
  end

  private

  def is_increasing?(node)
    @current_n.nil? || node.data >= @current_n
  end

  def visit(node)
    node.visited = true
    @current_n = node.data
  end
end

# NOTE: This class is for testing codes above.
class IsBstTest
  class << self
    def execute
      bst_binary_tree = BinaryTree.new(bst_root)
      p bst_binary_tree.is_bst?

      not_bst_binary_tree = BinaryTree.new(not_bst_root)
      p not_bst_binary_tree.is_bst?
    end

    def bst_root
      # tree is like below
      #     10
      #  5     15
      # 3 8  12 18
      Node.new(
        10,
        Node.new(
          5,
          Node.new(3),
          Node.new(8)
        ),
        Node.new(
          15,
          Node.new(12),
          Node.new(18)
        )
      )
    end

    def not_bst_root
      # tree is like below
      #     10
      #  8     19
      # 3 4  22 18
      Node.new(
        10,
        Node.new(
          8,
          Node.new(3),
          Node.new(4)
        ),
        Node.new(
          19,
          Node.new(22),
          Node.new(18)
        )
      )
    end
  end
end

IsBstTest.execute
