require_relative 'node'

class LinkedList
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
    old_node = get(index)
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
end
