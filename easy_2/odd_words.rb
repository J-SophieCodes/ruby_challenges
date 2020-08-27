=begin
Consider a character set consisting of:
  letters, 
  a space, and 
  a point. (no other punctuations?)

Words consist of:
  1+, but max 20 letters.
  (do we need to put a word limit here and throw an exception if exceeded?)

An input text consists of:
  1+ words, 
  separated by 1+ space
  terminated by 0+ space, followed by a point

Input should be read from, and including:
  the first letter of the first word, 
  up to and including the terminating point.

Output text is to be produced such that successive words are:
  - separated by a single space
  - with last word terminated by single point
    - what if original text didn't end with a point?

Odd words are copied in reverse order (odd wrt position, starting from 0)
Even words are echoed

For example:
  "whats the matter with kansas." becomes "whats eht matter htiw kansas."

BONUS: the characters must be read and printed one at a time
  - convert to list of chars
  - start with reverse = false
  - loop through each char and map to new array
    - return nil if char is a space
    - if reverse = true, prepend char to last word
    - if reverse = false, append char to last word
    - print string
    - if current char is a space, last char is a word, then reverse = !reverse

edge cases:
INPUT
  - "??><[]("
  - ""
  - "."
  - " , "
=end
require 'pry'

def convert(str)
  str.strip!
  new_str = ""
  reverse = false

  str.chars.each_with_index do |char, idx|
    if char == " "
      next if str[idx + 1] =~ /\W/
      reverse = !reverse
      new_str << char
    elsif char == "." || new_str.empty? || new_str.end_with?(" ")
      new_str << char
    else
      new_str.sub!(/(\w+)$/) { reverse ? (char + $1) : ($1 + char) }
    end
    
    puts new_str
  end 
  
  new_str
end

# def convert(str)
#   puts str.split.map.with_index {|word, idx| idx.odd? ? word.reverse : word }.join(" ").sub(/(?<=\w) .$/, ".")
# end

p convert(" hello   my name   is sophie marvelous . ")  #=> hello my name is jojo.
p convert("hello  . ")
p convert(".")
p convert("")

# h
# he
# hel
# hell
# hello
# hello 
# hello m
# hello ym
# hello ym 
# hello ym n
# hello ym na
# hello ym nam
# hello ym name
# hello ym name 
# hello ym name i
# hello ym name si
# hello ym name si 
# hello ym name si s
# hello ym name si so
# hello ym name si sop
# hello ym name si soph
# hello ym name si sophi
# hello ym name si sophie
# hello ym name si sophie 
# hello ym name si sophie m
# hello ym name si sophie am
# hello ym name si sophie ram
# hello ym name si sophie vram
# hello ym name si sophie evram
# hello ym name si sophie levram
# hello ym name si sophie olevram
# hello ym name si sophie uolevram
# hello ym name si sophie suolevram
# hello ym name si sophie suolevram.
# "hello ym name si sophie suolevram."
