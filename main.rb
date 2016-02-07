require './evaluator'

# Test sample
program = "12+3+5/(1+3)*(6-2)" # => 20

program = ARGV[0] unless ARGV[0].nil?

puts "Program"
puts "-----------------------------------"
p program
puts "-----------------------------------"
puts ""

puts "Tokens"
puts "-----------------------------------"
lex = Lex.new(program)
p lex.tokens
puts "-----------------------------------"
puts ""

puts "AST"
puts "-----------------------------------"
parser = Parser.new(lex)
parser.printAST
puts "-----------------------------------"
puts ""

puts "Result"
puts "-----------------------------------"
evaluator = Evaluator.new(parser.ast_root)
p evaluator.eval
puts "-----------------------------------"
