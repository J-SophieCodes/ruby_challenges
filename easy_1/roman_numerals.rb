=begin
- There is no need to be able to convert numbers larger than 
  about 3000
- Modern Roman numerals ... are written by expressing each digit 
  separately starting with the left most digit and skipping any 
  digit with a value of zero.

    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
=end

module RomanNumerals
  ROMAN_NUMERALS = {
    1 => %w(nil I II III IV V VI VII VIII IX), 
    10 => %W(nil X XX XXX XL L LX LXX LXXX XC),
    100 => %w(nil C CC CCC CD D DC DCC DCCC CM),
    1000 => %w(nil M MM MMM)
  }

  def to_roman
    self.digits.map.with_index do |num, pwr|
      next if num == 0
      ROMAN_NUMERALS[10**pwr][num]
    end.reverse.join
  end
end

class Integer
  include RomanNumerals
end
