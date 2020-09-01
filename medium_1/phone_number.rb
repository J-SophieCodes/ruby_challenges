=begin
Write a program that cleans up user-entered phone numbers
RULES:
- if < 10 digits, bad number
- if 10 digits, good number
- if 11 digits AND first num is 1, trim the 1, use last 10 digits
- if 11 digits AND first num isn't 1, bad number
- if > 11 digits, bad number
=end
require 'pry'
class PhoneNumber
  INVALID = '0000000000'
  attr_reader :number

  def initialize(input)
    @number = parse(input)
  end

  def parse(input)
    return INVALID if input =~ /[a-zA-Z]/

    num = input.gsub(/[^0-9]/, "")
    return INVALID if invalid_number?(num)

    num.size == 11 ? num[1..-1] : num
  end

  def invalid_number?(num) 
    num.size < 10 || 
    num.size > 11 || 
    num.size == 11 && num[0] != '1'
  end

  def area_code
    number[0..2]
  end

  def to_s
    number.sub(/(...)(...)(....)/, '(\1) \2-\3')
  end
end

# number = PhoneNumber.new('(123) 456-7890').number
# p number