# -*- encoding: utf-8 -*-

class Dice

  attr_accessor :t, :n, :w

  def initialize
    @t = 1
    @n = 2
    @w = 3
  end

  def north
  end

  def west
  end

  def south
  end

  def east
  end

end


def main(methods)
  dice = Dice.new
  vectors = []

  methods.each do |m|
    dice = dice.send(m)
    vectors.push dice.t
  end
  
  vectors
end

case $0
when __FILE__
  vectors = main(['E', 'E', 'E', 'E'])
  print vectors
when /spec[^\/]*$/
  # {spec of the implementation}
end


