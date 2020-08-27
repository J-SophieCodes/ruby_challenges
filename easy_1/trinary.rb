class Trinary 
  INVALID_INPUT = /[3-9a-z]/i
  BASE = 3

  def initialize(trinary_string)
    @trinary = parse_input(trinary_string)
  end

  def to_decimal
    decimal = 0
    @trinary.digits.each_with_index do |digit, pwr|
      decimal += digit * BASE ** pwr
    end
    decimal
  end

  def parse_input(value)
    value.scan(INVALID_INPUT).any? ? 0 : value.to_i
  end
end