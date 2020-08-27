class Octal
  INVALID_INPUT = /[89a-z]/i
  BASE = 8

  def initialize(octal_string)
    @octal = parse_input(octal_string)
  end

  def to_decimal
    decimal = 0
    @octal.digits.each_with_index do |digit, pwr|
      decimal += digit * BASE ** pwr
    end
    decimal
  end

  def parse_input(value)
    value.scan(INVALID_INPUT).any? ? 0 : value.to_i
  end
end