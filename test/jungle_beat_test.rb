require 'minitest/autorun'         # => true
require 'minitest/pride'           # => true
require_relative 'jungle_beat.rb'  # => true

class JungleBeatTest < Minitest::Test  # => Minitest::Test

  def test_it_takes_beats_when_created #pass1
    assert  JungleBeat.new("ding dah oom oom")  # => true
  end                                           # => :test_it_takes_beats_when_created

  def test_it_plays_given_beats #pass2
    jb = JungleBeat.new("ding dah oom oom")  # => #<JungleBeat:0x007fc5eb102f30 @beats="ding dah oom oom", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eb102df0 @head_node=#<Node:0x007fc5eb102dc8 @data="ding", @link=#<Node:0x007fc5eb102da0 @data="dah", @link=#<Node:0x007fc5eb102d78 @data="oom", @link=#<Node:0x007fc5eb102d50 @data="oom", @link=nil>>>>>>

    assert jb.play  # => true
  end               # => :test_it_plays_given_beats

  def test_it_can_append_beats #pass3
    jb = JungleBeat.new("ding dah")  # => #<JungleBeat:0x007fc5eb128050 @beats="ding dah", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eb129fe0 @head_node=#<Node:0x007fc5eb12a288 @data="ding", @link=#<Node:0x007fc5eb12a3a0 @data="dah", @link=nil>>>>
    jb.append("oom oom")             # => #<Node:0x007fc5eaa43f28 @data="oom oom", @link=nil>

    assert_equal "ding dah oom oom", jb.linked_list.all
  end                                                    # => :test_it_can_append_beats

  def test_it_can_list_all_the_inputs #pass4
    jb = JungleBeat.new("ding dah")  # => #<JungleBeat:0x007fc5eb1307a0 @beats="ding dah", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eb130d18 @head_node=#<Node:0x007fc5eb130db8 @data="ding", @link=#<Node:0x007fc5eb130f20 @data="dah", @link=nil>>>>
    jb.append("oom oom")             # => #<Node:0x007fc5eb132dc0 @data="oom oom", @link=nil>

    assert_equal "ding dah oom oom", jb.all
  end                                        # => :test_it_can_list_all_the_inputs

  def test_beats_can_be_validated_with_true #pass5
    jb = JungleBeat.new("ding dah")  # => #<JungleBeat:0x007fc5eaa49dd8 @beats="ding dah", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eaa49ce8 @head_node=#<Node:0x007fc5eaa49cc0 @data="ding", @link=#<Node:0x007fc5eaa49c98 @data="dah", @link=nil>>>>
    jb.append("oom")                 # => #<Node:0x007fc5eaa497c0 @data="oom", @link=nil>
    jb.append("oom")                 # => #<Node:0x007fc5eaa494f0 @data="oom", @link=nil>

    assert_equal true, jb.includes?("dah")  # => true
  end                                       # => :test_beats_can_be_validated_with_true

  def test_beats_can_be_refuted_with_false #pass6
    jb = JungleBeat.new("ding dah")  # => #<JungleBeat:0x007fc5eb13a480 @beats="ding dah", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eb13a390 @head_node=#<Node:0x007fc5eb13a368 @data="ding", @link=#<Node:0x007fc5eb13a318 @data="dah", @link=nil>>>>
    jb.append("oom")                 # => #<Node:0x007fc5eb139e18 @data="oom", @link=nil>
    jb.append("oom")                 # => #<Node:0x007fc5eb139b48 @data="oom", @link=nil>

    assert_equal false, jb.includes?("yoyo")  # => true
  end                                         # => :test_beats_can_be_refuted_with_false

  def test_it_can_prepend_beats_to_the_head_beat #7
    jb = JungleBeat.new("ding dah")         # => #<JungleBeat:0x007fc5eaa50ac0 @beats="ding dah", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eaa509d0 @head_node=#<Node:0x007fc5eaa509a8 @data="ding", @link=#<Node:0x007fc5eaa50980 @data="dah", @link=nil>>>>
    puts jb.all                             # => nil
    jb.append("woo")                        # => #<Node:0x007fc5eaa52168 @data="woo", @link=nil>
    puts jb.all                             # => nil
    jb.prepend("woo")                       # => #<Node:0x007fc5eaa53ec8 @data="woo", @link=#<Node:0x007fc5eaa509a8 @data="ding", @link=#<Node:0x007fc5eaa50980 @data="dah", @link=#<Node:0x007fc5eaa52168 @data="woo", @link=nil>>>>
    puts jb.all                             # => nil
    assert_equal "woo ding da woo", jb.all
  end                                       # => :test_it_can_prepend_beats_to_the_head_beat

  def test_it_can_return_a_count_of_beats #pass8
    jb = JungleBeat.new("ding dah")  # => #<JungleBeat:0x007fc5eb118f38 @beats="ding dah", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eb118e20 @head_node=#<Node:0x007fc5eb118df8 @data="ding", @link=#<Node:0x007fc5eb118dd0 @data="dah", @link=nil>>>>
    jb.append("oom")                 # => #<Node:0x007fc5eb118808 @data="oom", @link=nil>
    jb.all                           # => "dah oom"

    assert_equal 3, jb.count
  end                         # => :test_it_can_return_a_count_of_beats

  def test_it_can_pop_one_beat_from_the_end #pass9
    jb = JungleBeat.new("ding dah")  # => #<JungleBeat:0x007fc5eb111cb0 @beats="ding dah", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eb110ab8 @head_node=#<Node:0x007fc5eb110a90 @data="ding", @link=#<Node:0x007fc5eb110a68 @data="dah", @link=nil>>>>
    jb.append("woo")                 # => #<Node:0x007fc5eb10bef0 @data="woo", @link=nil>
    jb.append("woo")                 # => #<Node:0x007fc5eb10bbf8 @data="woo", @link=nil>
    jb.pop(1)                        # => "woo"

    assert_equal "ding dah woo" , jb.all
  end                                     # => :test_it_can_pop_one_beat_from_the_end

  def test_it_can_pop_a_number_of_beats #pass10
    jb = JungleBeat.new("ding dah woo woo")  # => #<JungleBeat:0x007fc5eb139620 @beats="ding dah woo woo", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eb139da0 @head_node=#<Node:0x007fc5eb139f30 @data="ding", @link=#<Node:0x007fc5eb139fd0 @data="dah", @link=#<Node:0x007fc5eb13a160 @data="woo", @link=#<Node:0x007fc5eb13a200 @data="woo", @link=nil>>>>>>
    jb.append("oom")                         # => #<Node:0x007fc5eaa5bc40 @data="oom", @link=nil>
    jb.append("oom")                         # => #<Node:0x007fc5eaa5b970 @data="oom", @link=nil>
    jb.pop(3)                                # => "woo oom oom"

    assert_equal 'ding dah woo', jb.all
  end                                    # => :test_it_can_pop_a_number_of_beats

  def test_it_can_insert_beat_in_arbitrary_position #pass11
    jb = JungleBeat.new("ding dah woo woo")  # => #<JungleBeat:0x007fc5eaa58810 @beats="ding dah woo woo", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eaa586a8 @head_node=#<Node:0x007fc5eaa58680 @data="ding", @link=#<Node:0x007fc5eaa58658 @data="dah", @link=#<Node:0x007fc5eaa58630 @data="woo", @link=#<Node:0x007fc5eaa58608 @data="woo", @link=nil>>>>>>
    jb.append("oom")                         # => #<Node:0x007fc5eaa58090 @data="oom", @link=nil>
    jb.append("oom")                         # => #<Node:0x007fc5eaa592b0 @data="oom", @link=nil>
    jb.insert("yoyo", 2)                     # => #<Node:0x007fc5eaa53e50 @data="yoyo", @link=#<Node:0x007fc5eaa58630 @data="woo", @link=#<Node:0x007fc5eaa58608 @data="woo", @link=#<Node:0x007fc5eaa58090 @data="oom", @link=#<Node:0x007fc5eaa592b0 @data="oom", @link=nil>>>>>

    assert_equal 'ding yoyo dah woo woo oom oom', jb.all
  end                                                     # => :test_it_can_insert_beat_in_arbitrary_position

  def test_it_can_insert_beat_on_the_first_beat_position #pass12
    jb = JungleBeat.new("ding dah woo woo")  # => #<JungleBeat:0x007fc5eb1225d8 @beats="ding dah woo woo", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eb122470 @head_node=#<Node:0x007fc5eb122420 @data="ding", @link=#<Node:0x007fc5eb1223f8 @data="dah", @link=#<Node:0x007fc5eb1223d0 @data="woo", @link=#<Node:0x007fc5eb122380 @data="woo", @link=nil>>>>>>
    jb.append("oom")                         # => #<Node:0x007fc5eb1217f0 @data="oom", @link=nil>
    jb.append("oom")                         # => #<Node:0x007fc5eb121138 @data="oom", @link=nil>
    jb.insert("yoyo", 1)                     # => #<Node:0x007fc5eb120aa8 @data="yoyo", @link=#<Node:0x007fc5eb1223f8 @data="dah", @link=#<Node:0x007fc5eb1223d0 @data="woo", @link=#<Node:0x007fc5eb122380 @data="woo", @link=#<Node:0x007fc5eb1217f0 @data="oom", @link=#<Node:0x007fc5eb121138 @data="oom", @link=nil>>>>>>

    assert_equal 'yoyo ding dah woo woo oom oom', jb.all
  end                                                     # => :test_it_can_insert_beat_on_the_first_beat_position

  def test_it_can_find_a_given_node  #pass13
    jb = JungleBeat.new('ding dah woo woo')  # => #<JungleBeat:0x007fc5eb10a000 @beats="ding dah woo woo", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eb109ee8 @head_node=#<Node:0x007fc5eb109ec0 @data="ding", @link=#<Node:0x007fc5eb109e98 @data="dah", @link=#<Node:0x007fc5eb109e70 @data="woo", @link=#<Node:0x007fc5eb109e48 @data="woo", @link=nil>>>>>>
    jb.append('tang')                        # => #<Node:0x007fc5eb109600 @data="tang", @link=nil>
    jb.append('clan')                        # => #<Node:0x007fc5eb1090d8 @data="clan", @link=nil>

    assert_equal "woo tang clan", jb.find(4, 3)
  end                                            # => :test_it_can_find_a_given_node

  def test_the_default_voice_is_boing #14
    jb = JungleBeat.new('ding dah woo woo')  # => #<JungleBeat:0x007fc5eb132118 @beats="ding dah woo woo", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eb131fb0 @head_node=#<Node:0x007fc5eb131f88 @data="ding", @link=#<Node:0x007fc5eb131f60 @data="dah", @link=#<Node:0x007fc5eb131f38 @data="woo", @link=#<Node:0x007fc5eb131f10 @data="woo", @link=nil>>>>>>
    jb.voice('Boing')                        # => "Boing"

    assert_equal 'Boing', jb.voice
  end                               # => :test_the_default_voice_is_boing

  def test_it_can_change_the_voice #15
    jb = JungleBeat.new('ding dah woo woo')  # => #<JungleBeat:0x007fc5eb113998 @beats="ding dah woo woo", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eb113880 @head_node=#<Node:0x007fc5eb113858 @data="ding", @link=#<Node:0x007fc5eb113830 @data="dah", @link=#<Node:0x007fc5eb113808 @data="woo", @link=#<Node:0x007fc5eb1137e0 @data="woo", @link=nil>>>>>>
    jb.voice('Alice')                        # => "Alice"

    assert_equal 'Alice', jb.voice('Alice')  # => true
  end                                        # => :test_it_can_change_the_voice

  def test_it_can_reset_the_voice_back_to_default #pass16
    jb = JungleBeat.new('ding dah woo woo')  # => #<JungleBeat:0x007fc5eaa41f70 @beats="ding dah woo woo", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eaa41de0 @head_node=#<Node:0x007fc5eaa41d90 @data="ding", @link=#<Node:0x007fc5eaa41d68 @data="dah", @link=#<Node:0x007fc5eaa41d40 @data="woo", @link=#<Node:0x007fc5eaa41d18 @data="woo", @link=nil>>>>>>
    jb.voice('Alice')                        # => "Alice"
    jb.reset_voice                           # => "Boing"

    assert_equal 'Boing', jb.reset_voice  # => true
  end                                     # => :test_it_can_reset_the_voice_back_to_default

  def test_it_has_a_default_rate  #pass17
    jb = JungleBeat.new('ding dah woo woo')  # => #<JungleBeat:0x007fc5eaa49ae0 @beats="ding dah woo woo", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eaa49ea0 @head_node=#<Node:0x007fc5eb133f90 @data="ding", @link=#<Node:0x007fc5eb133f68 @data="dah", @link=#<Node:0x007fc5eb133f18 @data="woo", @link=#<Node:0x007fc5eb133ef0 @data="woo", @link=nil>>>>>>
    jb.rate                                  # => 0

    refute_equal 500, jb.rate  # => false
  end                          # => :test_it_has_a_default_rate

  def test_it_can_reset_the_rate_back_to_default  #18
    jb = JungleBeat.new('ding dah woo woo')  # => #<JungleBeat:0x007fc5eb12a6e8 @beats="ding dah woo woo", @rate=500, @voice="Boing", @initial_rate=500, @initial_voice="Boing", @linked_list=#<LinkedList:0x007fc5eb12a508 @head_node=#<Node:0x007fc5eb12a490 @data="ding", @link=#<Node:0x007fc5eb12a418 @data="dah", @link=#<Node:0x007fc5eb12a3f0 @data="woo", @link=#<Node:0x007fc5eb12a378 @data="woo", @link=nil>>>>>>
    jb.rate(300)                             # => 300
    assert_equal 300, jb.rate(300)           # => true
    jb.reset_rate                            # => 500

    assert_equal 500, jb.reset_rate  # => true
  end                                # => :test_it_can_reset_the_rate_back_to_default

end  # => :test_it_can_reset_the_rate_back_to_default
