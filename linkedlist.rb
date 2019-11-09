class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(value)
    if @data == nil
      @data = LinkedListNode.new(value)
    else
      # put in next node
      @data = LinkedListNode.new(value, @data)
    end
  end

  def pop
    if @data
      d = @data.value
      @data = @data.next_node
    else
      d = 'nil'
    end
    return d
  end
end



def print_values(list_node)
  if list_node
    print "#{list_node.value}--> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

# Reverse with stack:
# def reverse_list(list)
#   stack = Stack.new
#
#   while list
#     stack.push(list.value)
#     list = list.next_node
#   end
#
#   return stack.data
# end


def reverse_list(node, previous=nil)

    if node.next_node == nil
      #puts "base case #{previous.value}"
      node.next_node = previous
    else
      reverse_list(node.next_node, node)
      #puts "previous #{previous.value}"
      node.next_node = previous
    end

end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
print_values(node3)
puts "-------"
revlist = reverse_list(node3)
print_values(node1)
