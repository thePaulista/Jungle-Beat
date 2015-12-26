require_relative 'linked_list.rb'
require 'pry'

class JungleBeat
  attr_accessor :beats, :linked_list
  def initialize(beats=nil)
    @beats = beats
    @rate = 500
    @voice = "Boing"
    @initial_rate= @rate
    @initial_voice = @voice

    solo_beats = beats.split
    initial_beat = solo_beats[0]
    @linked_list = LinkedList.new(initial_beat)
    solo_beats.each do |beat|
    linked_list.append(beat)
    end
  end

  def play
    `say -r #{@rate} -v #{@voice} #"{all}"`
  end

  def rate(speed=0)
    @rate = speed
  end

  def reset_rate
    @rate = @initial_rate
  end

  def voice(choice)
    @voice = choice
  end

  def reset_voice
    @voice = @initial_voice
  end

  def append(beats)
    @linked_list.append(beats)
  end

  def prepend(beats)
    @linked_list.prepend(beats)
  end

  def insert(data, position)
    @linked_list.insert(data, position)
  end

  def all
    @linked_list.all
  end

  def includes?(beat)
    @linked_list.includes?(beat)
  end

  def find(position, num=1)
    @linked_list.find(position, num)
  end

  def count
    @linked_list.count
  end

  def pop(n)
    @linked_list.pop(n)
  end

  def find(position, amount)
    @linked_list.find(position, amount)
  end

end

allowable_beats = "beat bop beat bop beat bop beat"
jb = JungleBeat.new(allowable_beats)
jb.play
