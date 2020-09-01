=begin
Rule 1: 
  If a word begins with a vowel sound, add an "ay" to the end

Rule 2: 
  If a word begins with a consonant sound, move it to the end of 
  the word, and then add an "ay" sound to the end of the word.

=end
require 'pry'

# class PigLatin
#   GROUP1 = %w(a e i o u xr yt)
#   GROUP2 = %w(sch ch .?qu thr th)
#   ALL = GROUP1 + GROUP2

#   def self.translate(str)
#     words = str.split
    
#     words.map do |word|
#       pat = ALL.find { |pat| (/#{pat}/ =~ word) == 0 } || word[0]
  
#       word.sub(/(#{pat})(.+)/) do
#         GROUP1.include?($1) ? ($1 + $2 + "ay") : ($2 + $1 + "ay")
#       end
#     end.join(" ")
#   end
# end

# SOLUTION
def self.translate_word(word)
  if begins_with_vowel_sound?(word)
    word + 'ay'
  else
    consonant_sound, the_rest_of_word = parse_for_consonant(word)
    the_rest_of_word + consonant_sound + 'ay'
  end
end

def self.begins_with_vowel_sound?(word)
  word.match(/\A[aeiou]|[xy][^aeiou]/)
end

def self.parse_for_consonant(word)
  consonant_split = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
  [consonant_split[1], consonant_split[2]]
end
end