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
      @t = reverse(@w)
      @w = wt
    end
  end

  def south
    tap do
      st = @t
      @t = @n
      @n = reverse(st)
    end
  end

  def east
    tap do 
      et = @t
      @t = @w  
      @w = reverse(et)
    end
  end


  private
  def reverse(d)
    7 - d
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


