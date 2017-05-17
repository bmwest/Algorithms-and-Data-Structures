require_relative 'node'
require 'pry'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def size
    if @head == nil
      return 0
    end
    count = 1
    current_node = @head
      until current_node.next == nil
        count+= 1
        current_node = current_node.next
      end
    return count
  end

  def insert(index, node)
    if index == 0
      if @head == nil
        return @head = node
      elsif @head.next == nil
        temp_node = @head
        @head = node
        return @head.next = temp_node
      end
    end
    prev_node = get(index - 1)
    old_node = prev_node.next
    prev_node.next = node
    node.next = old_node
  end

  def get(index)
    current_node = @head
    index.times do
      current_node = current_node.next
    end
    return current_node
  end

  def delete(index)
    if index == 0
      old_head = @head
      @head = old_head.next
      return old_head.next = nil
    end
    node1 = get(index - 1)
    old_node = node1.next
    node2 = old_node.next
    node1.next = node2
    old_node.next = nil
  end

  def replace(index, node)
    prev_node = get(index)
    prev_node_index = index
    delete(prev_node_index)
    new_node = insert(index, node)
  end

  def reverse
    current_node = @head
    # binding.pry
    next_node = current_node.next
    prev_node = current_node
    current_node.next = prev_node
    current_node = next_node
    if current_node.next == nil
      return
    end
    reverse
  end
end

list = LinkedList.new()
node = Node.new("zero")
node2 = Node.new("one")
node3 = Node.new("two")
node4 = Node.new("three")
node5 = Node.new("four")

list.insert(0, node)
list.insert(1, node2)
list.insert(2, node3)
list.insert(3, node4)
list.insert(4, node5)

list.get(0).data
list.get(1).data
list.get(2).data
list.get(3).data
list.get(4).data

list.reverse

list.get(0).data
list.get(1).data
list.get(2).data
list.get(3).data
list.get(4).data
