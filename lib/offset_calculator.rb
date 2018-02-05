require 'Date'
# This calculator will take the key created by keygen,
# perform some math wizardry with the current date,
# and then determine the total rotation for each letter.
class OffsetCalculator
  attr_reader :the_date,
              :the_squared_date,
              :the_date_offset

  def initialize
    @the_date = Date.today.strftime('%d%m%y')
    @the_squared_date = (@the_date.to_i**2).to_s
    @the_date_offset = @the_squared_date[-4..-1]
  end

  def date_offset_a
    @the_date_offset[0].to_i 
  end

  def date_offset_b
    @the_date_offset[1].to_i
  end

  def date_offset_c
    @the_date_offset[2].to_i
  end

  def date_offset_d
    @the_date_offset[3].to_i
  end
end


#lookup file.io

#arg v for using command line in ruby
# input_array = ARGV
# Mike has a tutorial video on ARGV which is pretty good
