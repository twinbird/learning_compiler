require 'test/unit'
require './lex'

class TestLexer < Test::Unit::TestCase
  def setup
    @program = "12+3+5/(1+3)*(6-2)" # => 20
    @space_sperate_program = "12 + 3 + 5 / (1 + 3) * (6 - 2)" # => 20
    @parsed_lexis = ["12","+","3","+","5","/","(","1","+","3",")","*","(","6","-","2",")"]

    @program_parsed_lex = Lex.new(@program)
    @space_separate_program_parsed_lex = Lex.new(@space_sperate_program)
  end

  def test_parse
    assert_equal(@program_parsed_lex.tokens, @parsed_lexis)
    assert_equal(@program_parsed_lex.parse_after_snapshot, @parsed_lexis)
    assert_equal(@space_separate_program_parsed_lex.parse_after_snapshot, @parsed_lexis)
  end

  def test_space_sperate_program_parse
    assert_equal(@space_separate_program_parsed_lex.tokens, @parsed_lexis)
    assert_equal(@space_separate_program_parsed_lex.parse_after_snapshot, @parsed_lexis)
  end

  def test_get_token_first
    assert_equal(@program_parsed_lex.get_token, @parsed_lexis.first)
    assert_equal(@program_parsed_lex.tokens, @parsed_lexis[1..-1])
    assert_equal(@program_parsed_lex.parse_after_snapshot, @parsed_lexis)
  end

  def test_get_token_last
    (@parsed_lexis.size - 1).times {|i| @program_parsed_lex.get_token}
    assert_equal(@program_parsed_lex.get_token, @parsed_lexis.last)
    assert_equal(@space_separate_program_parsed_lex.parse_after_snapshot, @parsed_lexis)
  end

  def test_get_token_for_empty
    @parsed_lexis.size.times {|i| @program_parsed_lex.get_token}
    assert_equal(@program_parsed_lex.get_token, nil)
    assert_equal(@space_separate_program_parsed_lex.parse_after_snapshot, @parsed_lexis)
  end

end
