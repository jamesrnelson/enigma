require_relative 'enigma'
require_relative 'offset_calculator'
require_relative 'keygen'
require 'pry'

e         = Enigma.new
rotations = OffsetCalculator.new
key       = KeyGen.new

e.read_input
e.encrypt(@text)
puts "Created #{@output} with the key #{key.key_offset} and date #{rotations.date_string}"
