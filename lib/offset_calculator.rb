
# This calculator will take the key created by keygen,
# perform some math wizardry with the current date,
# and then determine the total rotation for each letter.
require 'Date'

class OffsetCalculator
  def initialize
  end

  def the_date
    date = Date.today
    date_string = date.strftime("%d%m%y")
  end

  def the_squared_date(date_string)
    square = date_string.to_i ** 2
    square.to_s
  end

end


#lookup file.io

#arg v for using command line in ruby
# input_array = ARGV
# Mike has a tutorial video on ARGV which is pretty good

