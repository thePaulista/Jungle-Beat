gem 'minitest', '~> 5.b'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linked_list.rb'
require 'pry'

class LinkedListTest < Minitest::Test

  def test_it_can_take_a_data_when_created  #pass 1
    list = LinkedList.new("a")

    assert_equal "a", list.head_node.data
  end

  def test_the_list_can_be_empty  #pass2
    empty_list = LinkedList.new

    assert_equal nil, empty_list.head_node.data
  end

  def test_that_one_node_can_append_to_an_empty_list  #pass3
    list = LinkedList.new
    list.append('a')

    assert_equal 'a', list.head_node.link.data
  end

  def test_that_nodes_can_append_to_the_other_node #pass4
    list = LinkedList.new
    list.append('a')
    list.append('b')
    list.append('c')

    assert_equal 'c', list.head_node.link.link.link.data
  end

 	def test_a_node_can_be_prepended_to_an_empty_list #pass5
    list = LinkedList.new
 		list.prepend('a')

 		assert_equal 'a', list.head_node.data
	end

  def test_a_node_can_be_prepended_to_another_node #pass6
    list = LinkedList.new
    list.append('a')
    list.append('b')
    list.prepend('c')

    assert_equal 'c', list.head_node.data
 end

  def test_that_a_set_of_nodes_from_list_can_be_popped #pass7
    list = LinkedList.new
    list.append('a')
    list.append('b')
    list.append('c')
    list.append('d')

    assert_equal 'b c d',  list.pop(3)
  end

  def test_that_a_node_can_be_validated_with_true #pass8
    list = LinkedList.new
    list.append('a')
    list.append('b')
    list.append('c')
    list.append('d')

    assert_equal true, list.includes?('d')
    assert_equal true, list.includes?('c')
  end

  def test_that_a_node_can_be_validated_with_false #pass9
    list = LinkedList.new
    list.append('a')
    list.append('b')
    list.append('c')
    list.append('d')

    assert_equal false, list.includes?('z')
    assert_equal false, list.includes?('y')
  end

  def test_that_a_list_can_output_all_nodes #pass10
    list = LinkedList.new
    list.append('a')
    list.append('b')
    list.append('c')
    list.append('d')
    list.append('e')

    assert_equal 'a b c d e', list.all
   end

  def test_that_a_node_can_be_inserted_in_the_mid_part_of_the_link #pass11
    list = LinkedList.new
    list.append('a')
    list.append('b')
    list.append('c')
    list.append('d')
    list.append('e')
    list.insert('yo', 3)

    assert_equal 'a b yo c d e', list.all
  end

  def test_that_a_node_can_be_inserted_in_the_top_of_the_link #pass12
    list = LinkedList.new
    list.append('a')
    list.append('b')
    list.append('c')
    list.append('d')
    list.append('e')
    list.insert('primeiro', 1)

    assert_equal 'primeiro a b c d e', list.all
  end

  def test_that_a_node_can_be_inserted_in_the_end_of_the_link #pass13
    list = LinkedList.new
    list.append('a')
    list.append('b')
    list.append('c')
    list.append('d')
    list.append('e')
    list.insert('ultimo', 6)

    assert_equal 'a b c d e ultimo', list.all
  end

  def test_that_a_list_can_output_all_nodes #pass13
    list = LinkedList.new
    list.append('a')
    list.append('b')
    list.append('c')
    list.append('d')
    list.append('e')

    assert_equal 'a b c d e', list.all
   end

   def test_that_the_count_works_with_append_and_prepend #pass14
     list = LinkedList.new
     list.append('a')
     list.append('b')
     list.append('c')
     list.append('d')
     list.prepend('e')

     assert_equal 5, list.count
    end

  def test_that_the_count_works_also_with_pop
    list = LinkedList.new
    list.append('a')
    list.append('b')
    list.append('c')
    list.prepend('d')
    list.append('e')
    list.pop(2)

    assert_equal 3, list.count
   end

   def test_that_data_can_be_found_and_returned_for_the_asking #pass16
     list = LinkedList.new
     list.append('a')
     list.append('b')
     list.append('c')
     list.append('d')
     list.append('e')

     assert_equal 'b c d', list.find(2,3)
   end

end
