class Node
  attr_accessor :data, :link  # => nil

  def initialize(data=nil, link=nil)
    @data = data                      # => nil
    @link = link                      # => nil
  end                                 # => :initialize

end  # => :initialize

Node.new  # => #<Node:0x007f9ca2042d60 @data=nil, @link=nil>
