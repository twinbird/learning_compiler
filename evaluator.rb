require './parser'

class Evaluator
  def initialize(ast_root)
    @ast_root = ast_root
  end

  def eval
    eval_impl(@ast_root)
  end

  private

  def eval_impl(ast_node)
    v = ast_node.value
    arg1 = eval_impl(ast_node.left) unless ast_node.left.nil?
    arg2 = eval_impl(ast_node.right) unless ast_node.right.nil?
    case v
    when "+"
      return arg1 + arg2
    when "-"
      return arg1 - arg2
    when "/"
      return arg1 / arg2
    when "*"
      return arg1 * arg2
    else
      return v.to_f
    end
  end
end
