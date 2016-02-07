require './evaluator'

#program = "12 + 3 + 5 / (1 + 3) * (6 - 2)" # => 20
program = "12+3+5/(1+3)*(6-2)" # => 20
#program = "(1+2)*(3-(4/5))"

program = ARGV[0] unless ARGV[0].nil?

p program

lex = Lex.new(program)
p lex.tokens

parser = Parser.new(lex)
parser.printAST

evaluator = Evaluator.new(parser.ast_root)
p evaluator.eval
