=begin
Write a program that, given a word and a list of possible anagrams, 
selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like 
"enlists" "google" "inlets" "banana" the program should return a 
list containing "inlets". Please read the test suite for exact rules 
of anagrams.
=end

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(list)
    list.select { |candidate| anagram?(Anagram.new(candidate)) }
  end

  def anagram?(other)
    !identical?(other) && same_letters?(other)
  end

  def identical?(other)
    word.downcase == other.word.downcase
  end

  def same_letters?(other)
    sort == other.sort
  end

  def sort
    word.downcase.chars.sort.join
  end
end