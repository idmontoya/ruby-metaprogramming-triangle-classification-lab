class Triangle
  # write code here
  attr_accessor :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def kind
    valid_triangle

    if (@side_a == @side_b) && (@side_b == @side_c)
      :equilateral
    elsif (@side_a == @side_b) || (@side_b == @side_c) || (@side_a == @side_c)
      :isosceles
    elsif(@side_a -= @side_b) || (@side_b -= @side_c) || (@side_a -= @side_c)
      :scalene
    end
  end

  def valid_triangle
    triangle = [(side_a + side_b > side_c), (side_a + side_c > side_b), (side_b + side_c > side_a)]
    [side_a, side_b, side_c].each do |side|
      triangle << false if side <= 0
      raise TriangleError if triangle.include?(false)
    end
  end



  class TriangleError < StandardError
  end


end
