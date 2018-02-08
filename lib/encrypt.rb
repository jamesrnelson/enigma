require_relative 'enigma'
require_relative 'offset_calculator'
require_relative 'keygen'
require 'pry'

e         = Enigma.new
rotations = OffsetCalculator.new
key       = KeyGen.new

e.read_input
e.encrypt(@text)
#binding.pry
puts "Created #{e.output} with the key #{key.key_string} and date #{rotations.date_string}"
