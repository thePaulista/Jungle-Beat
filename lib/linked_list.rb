require_relative 'node.rb'
require 'pry'

class LinkedList
  attr_reader :head_node

  def initialize(data=nil)
    @head_node = nil
  end

  def append(data)
    if @head_node == nil
      @head_node = Node.new(data)
    else
      current_node = @head_node
      until current_node.link == nil
        current_node = current_node.link
      end
      current_node.link = Node.new(data,nil)
    end
  end

  def prepend(data)
    new_head_node = Node.new(data, @head_node)
    @head_node = new_head_node
  end

  def remove_last_node
    current_node = @head_node
    until current_node.link.link == nil
      current_node = current_node.link
    end
    target_node = current_node.link.data
    current_node.link = nil
    return target_node
  end

  def insert(data, position)
    if @head_node == nil && position == 0
      then append(data)
    else
      pre_node = node_at(position-1)
      post_node = pre_node.link
      new_node = Node.new(data, post_node)
      pre_node.link = new_node
    end
  end

  def node_at(position)
    current_node = @head_node
    until count == position || current_node == nil
      current_node = current_node.link
    end
    current_node
  end

  def pop(number)
     popped_nodes = []
     number.times do
       popped_nodes << remove_last_node
     end
      return pops = popped_nodes.reverse.join(" ")
  end

  def find(position, amount)
    list = []
    index = 0
    if @head_node == nil && position == 0
      return 'Empty list'
    else
      current_node = @head_node
      until index == position
        current_node = current_node.link
        index += 1
      end
        amount.times do |i|
        list << current_node.data
        current_node = current_node.link
      end
    end
      return list.join(" ")
  end

  def includes?(data)
    if @head_node == nil
      return 'Empty list'
    else
    current_node = @head_node
    until current_node.data == data || current_node.link == nil
      current_node = current_node.link
    end
      return true if current_node.data == data
    end
    return false
  end

  def count
    count = 0
    current_node = @head_node
    until current_node.link == nil
      current_node = current_node.link
      count += 1
    end
    return count
  end

  def all
    if @head_node == nil
      return "Empty list"
    else
      current_node = @head_node
      list_all = []
      until current_node.link == nil
      current_node = current_node.link
      list_all << current_node.data
      end
      return list_all.join(" ")
    end
  end

end
