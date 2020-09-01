=begin
input: decimal number
output: sequence for secret handshake
 
RULES:
  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump
  10000 = Reverse the order of the operations in the secret 
          handshake.


=end

# class SecretHandshake
#   BASE = 2

#   HANDSHAKE = {
#     1 => :wink,
#     10 => :double_blink,
#     100 => :close_your_eyes,
#     1000 => :jump,
#     10000 => :reverse
#   }

#   attr_reader :input, :command_list, :binary

#   def initialize(input)
#     @input = input
#     @binary = []
#     @command_list = []
#   end

#   def commands
#     parse_input

#     @binary.reject(&:zero?).each do |code|
#       send HANDSHAKE[code]
#     end

#     command_list
#   end

#   def wink
#     command_list << "wink"
#   end

#   def double_blink
#     command_list << "double blink"
#   end

#   def close_your_eyes
#     command_list << "close your eyes"
#   end

#   def jump
#     command_list << "jump"
#   end

#   def reverse
#     command_list.reverse!
#   end

#   def parse_input
#     input.class == String ? to_binary : decimal_to_binary
#   end

#   def to_binary
#     pwr = 0

#     input.to_i.digits.each do |digit|
#       binary << (digit * 10 ** pwr)
#       pwr += 1
#     end
#   end

#   def decimal_to_binary
#     num = input
#     div, mod = nil
#     pwr = 0
    
#     loop do
#       div, mod = num.divmod(BASE)
#       binary << (mod * 10**pwr)
#       break if div.zero?
#       num = div
#       pwr += 1
#     end
#   end
# end


# USING to_s(base) to change base

class SecretHandshake
  BASE = 2

  HANDSHAKE = {
    1 => :wink,
    10 => :double_blink,
    100 => :close_your_eyes,
    1000 => :jump,
    10000 => :reverse
  }

  attr_reader :input, :command_list, :binary

  def initialize(input)
    @codes = parse(input)
    @command_list = []
  end

  def commands
    @codes.reject(&:zero?).each do |code|
      send HANDSHAKE[code]
    end

    command_list
  end

  def wink
    command_list << "wink"
  end

  def double_blink
    command_list << "double blink"
  end

  def close_your_eyes
    command_list << "close your eyes"
  end

  def jump
    command_list << "jump"
  end

  def reverse
    command_list.reverse!
  end

  def parse(input)
    input = input.class == String ? input.to_i : input.to_s(BASE).to_i
    pwr = 0
    
    input.digits.each_with_object([]) do |digit, arr|
      arr << (digit * 10 ** pwr)
      pwr += 1
    end
  end 
end


# handshake = SecretHandshake.new 9
# p handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# p handshake.commands # => ["jump","wink"]