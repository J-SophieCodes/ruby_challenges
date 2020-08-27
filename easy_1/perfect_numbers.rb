=begin
  - Perfect: Sum of factors = number
    e.g. 6 = 1 + 2 + 3
    e.g. 28 = 1 + 2 + 4 + 7 + 14
  - Abundant: Sum of factors > number
  - Deficient: Sum of factors < number
    e.g. Prime numbers 7, 13, etc are deficient by the Nicomachus 
        classification.

Write a program that can tell if a number is perfect, abundant or 
deficient.
=end

class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1

    factors = get_factors(num)

    case factors.sum - num <=> num
    when -1 then 'deficient'
    when 0 then 'perfect'
    when 1 then 'abundant'
    end
  end

  def self.get_factors(num)
    (1..Math.sqrt(num).to_i).each_with_object([]) do |n, arr|
      arr << n << num / n if num % n == 0
    end
  end
end

p PerfectNumber.classify(3)