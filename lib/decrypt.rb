require_relative 'enigma'
require_relative 'offset_calculator'
require_relative 'keygen'
require 'pry'

e         = Enigma.new
rotations = OffsetCalculator.new
key       = KeyGen.new

e.read_input
e.decrypt(@text, @command_line_key.to_s)
puts "Created #{@output} with the key #{@command_line_key} and date #{@command_line_date}"
