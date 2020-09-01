=begin
1. starting from right, for every second digit
     - double it
     - if result > 10, minus 9
2. sum all digits
3. return true if sum % 10 == 0

functions:
- check validity
- return checksum, or the remainder (remainder from the mod?)
- add a digit to make set of numbers valid
=end

class Luhn
  def initialize(num)
    @number = num
  end

  def addends
    @number.digits.map.with_index do |digit, idx|
      idx.odd? ? process(digit) : digit
    end.reverse
  end

  def process(digit)
    result = digit * 2 
    result > 10 ? result - 9 : result
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def remainder
    checksum % 10
  end

  def self.create(input)
    new_num = input * 10
    new_luhn = Luhn.new(new_num)
    new_luhn.valid? ? new_num : new_num + 10 - new_luhn.remainder
  end
end

# p Luhn.create(123)
# p Luhn.create(873_956)
# p Luhn.create(837_263_756)