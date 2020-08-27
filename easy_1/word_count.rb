=begin
Write a program that given a phrase can count the occurrences of each 
word in that phrase.

For example, if we count the words for the input "olly olly in come 
free", we should get:

olly: 2
in: 1
come: 1
free: 1

=end

class Phrase
  def initialize(str)
    @phrase = str
    @words = @phrase.scan(/(?<!')\b[\w']+s'|\b[\w']+\b/) 
  end

  def word_count
    @words.each_with_object(Hash.new(0)) do |word, hsh|
      hsh[word.downcase] += 1
    end
  end
end