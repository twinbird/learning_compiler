# exBNF
# <expr> ::= <term> [('+'|'-') <term>]*
# <term> ::= <factor> [('*'|'/') <factor>]*
# <factor> ::= <number> | '(' <expr> ')'
# <number> ::= number

require './lex'

class Parser
  def initialize(lex)
    parse(lex)
  end

  def printAST
    printAbstractSyntaxTree(@ast_root, 0)
  end

  private

  def printAbstractSyntaxTree(node, depth)
    indent_size = 4
    if depth > 0
      tree_edge = " " * depth + (" " * indent_size * (depth - 1)) + "|" + ("-" * (indent_size - 1)) + " "
    else
      tree_edge = ""
    end
    puts "#{tree_edge}" + node.value unless node.value == nil
    unless node.left == nil
      printAbstractSyntaxTree(node.left, depth + 1)
    end
    unless node.right == nil
      printAbstractSyntaxTree(node.right, depth + 1)
    end
  end

  def parse(lex)
    @ast_root = expr(lex)
  end

  def expr(lex)
    n = term(lex)
    token = lex.peak_token
    while (token == "+" or token == "-")
      token = lex.get_token
      n = Node.new(n, term(lex), token)
      token = lex.peak_token
    end
    n
  end

  def term(lex)
    n = factor(lex)
    token = lex.peak_token
    while (token == "*" or token == "/")
      token = lex.get_token
      n = Node.new(n, factor(lex), token)
      token = lex.peak_token
    end
    n
  end

  def factor(lex)
    token = lex.peak_token
    if token == "("
      lex.get_token # 読み捨て
      n = expr(lex)
      token = lex.get_token # )を読み捨て
    else
      n = number(lex)
    end
    n
  end

  def number(lex)
    token = lex.get_token
    if token =~ /^\d+$/
      return Node.new(nil, nil, token)
    end
  end
end

class Node
  attr_reader :left, :right, :value

  def initialize(left, right, value)
    @left = left
    @right = right
    @value = value
  end
end
