#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Evaluator do

  def eval(list_of_expressions) do
    { result, _final_binding } =
        Enum.reduce(list_of_expressions,
                    {_result = [], _binding = binding()}, 
                    &evaluate_with_binding/2)
    Enum.reverse result
  end

  defp evaluate_with_binding(expression, { result, binding }) do
    { next_result, new_binding } = Code.eval_string(expression, binding)
    { [ "value> #{next_result}", "code>  #{expression}" | result ], new_binding }
  end
end
