require_relative 'enigma'
require_relative 'offset_calculator'
require_relative 'keygen'
require 'pry'

e         = Enigma.new
rotations = OffsetCalculator.new
key       = KeyGen.new

e.read_input
e.decrypt(e.text, e.command_line_key.to_s)
binding.pry
puts "Created #{e.output} with the key #{e.command_line_key} and date #{e.command_line_date}"
