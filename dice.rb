# -*- encoding: utf-8 -*-

class Dice

  attr_accessor :t, :n, :w

  def initialize
    @t = 1
    @n = 2
    @w = 3
  end

  def north
    tap do
      nt = @t
      @t = reverse(@n)
      @n = nt
    end
  end

  def west
    tap do
      wt = @t
      @t = 7 - @w
      @w = wt
    end
  end

  def south
    tap do
     self.north()
      @t = 7 - @t
      @n = 7 - @n
    end
  end

  def east
    tap do 
      self.west()
      @t = 7 - @t
      @w = 7 - @w
    end
  end

  alias_method :N, :north
  alias_method :W, :west
  alias_method :S, :south
  alias_method :E, :east

end


def main(methods)
  dice = Dice.new
  vectors = [dice.t]

  methods.each do |m|
    dice = dice.send(m)
    vectors.push dice.t
  end
  
  vectors.join()
end

case $0
when __FILE__
  vectors = main(['N', 'E', 'E', 'E'])
  print vectors
when /spec[^\/]*$/
  # {spec of the implementation}
end


