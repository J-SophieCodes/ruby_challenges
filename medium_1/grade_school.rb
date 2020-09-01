=begin
Store students' name and grade

Functions:
- Add a student's name to the roster for a grade
- Get a list of all students enrolled in a grade
- Get a sorted list of all students in all grades.
  {1=>["Anna", "Barb", "Charlie"], 2=>["Alex", "Peter"], ...}
- format doesn't matter; order matters
- Note that all our students only have one name. 
=end

class School
  def initialize
    @roster = Hash.new { |roster, grade| roster[grade] = [] }
  end

  def add(name, grade)
    @roster[grade].push(name).sort!
  end

  def to_h
    @roster.sort.to_h
  end

  def grade(num)
    @roster[num]
  end
end