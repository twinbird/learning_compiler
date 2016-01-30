class Lex
  attr_reader :tokens
  def initialize(code)
    @code = code
    @idx = 0
    @tokens = []
    parse
  end

  private

  def num_parse
    num_token = ""
    while (@code[@idx] =~ /\d/)
      num_token += @code[@idx]
      @idx += 1
    end
    num_token
  end

  def parse
    while (@idx < @code.length)
      case @code[@idx]
      when "+" then
        @tokens << "+"
        @idx += 1
      when "-" then
        @tokens << "-"
        @idx += 1
      when "/" then
        @tokens << "/"
        @idx += 1
      when "*" then
        @tokens << "*"
        @idx += 1
      when "(" then
        @tokens << "("
        @idx += 1
      when ")" then
        @tokens << ")"
        @idx += 1
      when /\d/ then
        @tokens << num_parse
      when /\s/ then
        @idx += 1
      else
        raise "unknown char" + @code[@idx] + ":" + @idx.to_s
      end
    end
  end

end
