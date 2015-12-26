gem 'minitest', '~> 5.2'    # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require_relative 'node.rb'  # => true

class NodeTesting < Minitest::Test  # => Minitest::Test

  def test_it_can_hold_data_as_node
    node = Node.new('a')             # => #<Node:0x007fcf690a5b50 @data="a", @link=nil>
    assert_equal 'a', node.data      # => true
  end                                # => :test_it_can_hold_data_as_node

  def test_node_has_a_link
    node_b = Node.new('b')            # => #<Node:0x007fcf690a4700 @data="b", @link=nil>
    node_a = Node.new('a', node_b)    # => #<Node:0x007fcf690a44a8 @data="a", @link=#<Node:0x007fcf690a4700 @data="b", @link=nil>>
    assert_equal node_b, node_a.link  # => true
  end                                 # => :test_node_has_a_link

  def test_node_can_point_to_a_nil_value
    node = Node.new('d')                  # => #<Node:0x007fcf690a7798 @data="d", @link=nil>
    assert_equal nil, node.link           # => true
  end                                     # => :test_node_can_point_to_a_nil_value

end  # => :test_node_can_point_to_a_nil_value

# >> Run options: --seed 54583
# >>
# >> # Running:
# >>
# >> \e[31m*\e[0m\e[32m*\e[0m\e[33m*\e[0m
# >>
# >> \e[31mF\e[0m\e[32ma\e[0m\e[33mb\e[0m\e[34mu\e[0m\e[35ml\e[0m\e[36mo\e[0m\e[31mu\e[0m\e[32ms\e[0m\e[33m \e[0m\e[34mr\e[0m\e[35mu\e[0m\e[36mn\e[0m in 0.001274s, 2354.7881 runs/s, 2354.7881 assertions/s.
# >>
# >> 3 runs, 3 assertions, 0 failures, 0 errors, 0 skips
