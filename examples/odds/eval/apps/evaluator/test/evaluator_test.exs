#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule EvaluatorTest do
  use ExUnit.Case

  import LineSigil

  test "evaluates a basic expression" do
    input = ~l"""
    1 + 2
    """
    
    output = ~l"""
    code>  1 + 2
    value> 3
    """

    run_test input, output
  end

  test "variables are propagated" do
    input = ~l"""
    a = 123
    a + 1
    """
    output = ~l"""
    code>  a = 123
    value> 123
    code>  a + 1
    value> 124
    """

    run_test input, output
  end

  defp run_test(lines, output) do
    assert output == Evaluator.eval(lines)
  end
end
