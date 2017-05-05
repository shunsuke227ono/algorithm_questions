class Stack
  def initialize
    @stack = []
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end

  def push(x)
    @stack << x
  end

  def isEmpty
    @stack.empty?
  end

  def show
    @stack
  end
end

# stack上のデータをstackのみのデータ構造を使って並べ替える.

def sort_stack(stack)
  sorted_stack = Stack.new

  while !stack.isEmpty
    item = stack.pop
    while !sorted_stack.isEmpty && sorted_stack.peek < item
      stack.push(sorted_stack.pop)
    end
    sorted_stack.push(item)
  end

  sorted_stack
end

s = Stack.new
s.push(4)
s.push(5)
s.push(3)
s.push(1)

p sort_stack(s)

s = Stack.new

p sort_stack(s)

s = Stack.new
s.push(4)
s.push(3)
s.push(2)
s.push(1)

p sort_stack(s)
