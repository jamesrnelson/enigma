require_relative 'enigma'
require_relative 'offset_calculator'
require_relative 'keygen'

e = Enigma.new
e.read_input
e.crack(@text, e.command_line_date)
