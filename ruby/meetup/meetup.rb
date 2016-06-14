require 'Date'

class Meetup
  W_DAYS = [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
  STARTING_DAYS = { :first => 1, :second => 8, :third => 15, :fourth => 23, :last => -7, :teenth => 13 }

  def initialize(month, year)
    @year = year
    @month = month
  end

  def day(wday, schedule)
    w_day = W_DAYS.find_index(wday)
    dt = Date.new(@year, @month, STARTING_DAYS[schedule])
    dt + w_day - dt.wday + ((dt.wday > w_day)? 7 : 0)
  end
end