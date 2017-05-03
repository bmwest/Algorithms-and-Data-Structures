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
    currentNode = @head
      until currentNode.next == nil
        count+= 1
        currentNode = currentNode.next
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
    currentNode = @head
    index.times do
      currentNode = currentNode.next
    end
    return currentNode
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
    next_node = nil
    prev_node = nil
    while current_node != nil
      next_node = current_node.next
      current_node.next = prev_node
      prev_node = current_node
      current_node = next_node
    end
    @head = prev_node
  end
end
