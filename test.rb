require 'test/unit'
require './lex'

class TestLexer < Test::Unit::TestCase
  def setup
    @program = "12+3+5/(1+3)*(6-2)" # => 20
    @space_sperate_program = "12 + 3 + 5 / (1 + 3) * (6 - 2)" # => 20
    @parsed_lexis = ["12","+","3","+","5","/","(","1","+","3",")","*","(","6","-","2",")"]
  end

  def test_parse
    lex = Lex.new(@program)
    assert_equal(lex.tokens, @parsed_lexis)
  end

  def test_space_sperate_program_parse
    lex = Lex.new(@space_sperate_program)
    assert_equal(lex.tokens, @parsed_lexis)
  end
end
