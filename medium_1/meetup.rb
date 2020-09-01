=begin
Typically meetups happen on the same day of the week.
Write code that calculates date of meetups.
=end
require 'date'
class Meetup
  attr_reader :year, :month, :weekday, :dates

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    @weekday = "#{weekday}?".to_sym
    @dates = get_dates
    send schedule
  end

  def first
    @dates.first
  end

  def second
    @dates[1]
  end

  def third
    @dates[2]
  end

  def fourth
    @dates[3]
  end

  def last
    @dates.last
  end

  def teenth
    @dates.find { |date| (13..19).include?(date.day) }
  end

  def get_dates
    start_day = Date.new(year, month)
    end_day = start_day.next_month - 1

    start_day.upto(end_day).select(&weekday)
  end
end

# SAMPLE SOLUTION

# class Meetup
#   def day(weekday, schedule)
#     working_date = Date.new(@date.year, @date.month, FIRST_DAY[schedule])
#     working_date += 1 until working_date.__send__("#{weekday}?")
#     @date = working_date
#   end

# private
#   FIRST_DAY = {
#     first:  1,
#     second: 8,
#     third:  15,
#     fourth: 22,
#     last:   -7,
#     teenth: 13
#   }

#   def initialize(month, year)
#     @date = Date.new(year, month, 1)
#   end
# end
