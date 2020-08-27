=begin
Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10

Examples
"cabbage" should be scored as worth 14 points
=end
require 'pry'
class Scrabble
  SCORES = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  def initialize(str)
    @str = str
  end

  def self.score(str)
    word = str.to_s.strip.upcase

    word.chars.reduce(0) do |sum, char|
      score = SCORES.keys.find do |key| 
                SCORES[key].include?(char)
              end
      sum + score
    end
  end

  def score
    self.class.score(@str)
  end
end

# puts Scrabble.new('street').score
# puts Scrabble.new('quirky').score
# puts Scrabble.new('OXYPHENBUTAZONE').score
# puts Scrabble.score('alacrity')