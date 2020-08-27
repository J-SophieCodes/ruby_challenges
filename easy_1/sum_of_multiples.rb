class SumOfMultiples
  DEFAULT = [3, 5]

  def self.to(max, multiples = DEFAULT)
    (0...max).select do |num|
      multiples.any? { |n| num % n == 0 }
    end.sum
   end
  
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(max)
    self.class.to(max, @multiples)
  end
end
