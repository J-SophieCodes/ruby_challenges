# class BeerSong
#   attr_reader :nth

#   def verses(start, finish)
#     start.downto(finish).map { |nth| verse(nth) }.join("\n")
#   end

#   def verse(nth)
#     @nth = nth
#     "#{bottles.capitalize} of beer on the wall, #{bottles} of beer.\n" \
#     "#{remaining_bottles} of beer on the wall.\n"
#   end

#   def bottles(num = nth)
#     case num
#     when (..-1) then "99 bottles"
#     when 0 then "no more bottles"
#     when 1 then "#{num} bottle"
#     else "#{num} bottles"
#     end
#   end

#   def remaining_bottles
#     case nth
#     when 0
#       "Go to the store and buy some more, #{bottles(nth - 1)}"
#     else
#       "Take #{one} down and pass it around, #{bottles(nth - 1)}"
#     end
#   end

#   def one
#     nth == 1 ? "it" : "one"
#   end

#   def lyrics
#     verses(99, 0)
#   end
# end

# Three approaches to implement this without if or case statements:
# - instance methods (lookup from hash)
# - lambda (lookup from hash)
# - classes (lookup from hash)
# - lookup tables abstract away a lot of the selection algorithm


#                        < USING CLASSES > - preferred

class BeerSong

  class ZeroVerse # better to be inside BeerSong namespace
    def self.verse
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
  
  class OneVerse
    def self.verse
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end
  
  class TwoVerse
    def self.verse
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end
  
  class DefaultVerse
    def self.verse
      "#{yield} bottles of beer on the wall, #{yield} bottles of beer.\n" \
      "Take one down and pass it around, #{yield - 1} bottles of beer on the wall.\n"
    end
  end

  VERSES = Hash.new(DefaultVerse).merge({
      0 => ZeroVerse,
      1 => OneVerse,
      2 => TwoVerse
    })

  def verse(number)
    VERSES[number].verse { number }
  end

  def verses(start, finish)
    start.downto(finish).map { |nth| verse(nth) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

#                              < USING METHODS >

# class BeerSong
 
#   VERSES = Hash.new(:default_verse).merge({
#       0 => :verse0,
#       1 => :verse1,
#       2 => :verse2
#     })

#   def verse(number)
#     send VERSES[number], number
#   end

#   def verses(start, finish)
#     start.downto(finish).map { |nth| verse(nth) }.join("\n")
#   end

#   def lyrics
#     verses(99, 0)
#   end

#   def verse0()
#     "No more bottles of beer on the wall, no more bottles of beer.\n" \
#     "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#   end

#   def verse1()
#     "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#     "Take it down and pass it around, no more bottles of beer on the wall.\n"
#   end

#   def verse2()
#     "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#     "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#   end

#   def default_verse(num)
#     "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
#     "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
#   end
# end

#                                 < USING PROC >

# class BeerSong
#    verse0 = proc do
#     "No more bottles of beer on the wall, no more bottles of beer.\n" \
#     "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#   end

#   verse1 = proc do
#     "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#     "Take it down and pass it around, no more bottles of beer on the wall.\n"
#   end

#   verse2 = proc do
#     "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#     "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#   end

#   default_verse = proc do |num|
#     "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
#     "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
#   end

#   VERSES = Hash.new(default_verse).merge({
#       0 => verse0,
#       1 => verse1,
#       2 => verse2
#     })

#   def verse(number)
#     VERSES[number].call number
#   end

#   def verses(start, finish)
#     start.downto(finish).map { |nth| verse(nth) }.join("\n")
#   end

#   def lyrics
#     verses(99, 0)
#   end
# end

p BeerSong.new.verse(99)