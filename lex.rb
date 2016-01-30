class Lex
  attr_reader :tokens
  attr_reader :parse_after_snapshot

  def initialize(code)
    @code = code
    @current_parse_idx = 0
    @tokens = []
    parse
    @parse_after_snapshot = @tokens.dup
  end

  def get_token
    @tokens.shift
  end

  private

  def num_parse
    num_token = ""
    while (@code[@current_parse_idx] =~ /\d/)
      num_token += @code[@current_parse_idx]
      @current_parse_idx += 1
    end
    num_token
  end

  def parse
    while (@current_parse_idx < @code.length)
      case @code[@current_parse_idx]
      when "+" then
        @tokens << "+"
        @current_parse_idx += 1
      when "-" then
        @tokens << "-"
        @current_parse_idx += 1
      when "/" then
        @tokens << "/"
        @current_parse_idx += 1
      when "*" then
        @tokens << "*"
        @current_parse_idx += 1
      when "(" then
        @tokens << "("
        @current_parse_idx += 1
      when ")" then
        @tokens << ")"
        @current_parse_idx += 1
      when /\d/ then
        @tokens << num_parse
      when /\s/ then
        @current_parse_idx += 1
      else
        raise "unknown char" + @code[@current_parse_idx] + ":" + @current_parse_idx.to_s
      end
    end
  end

end
