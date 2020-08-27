class Series
  def initialize(str)
    @digits = str.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > @digits.size
    @digits.each_cons(n).to_a
  end
end