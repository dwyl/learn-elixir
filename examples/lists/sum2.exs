#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule MyList do

  def sum(list), do: _sum(list, 0)

  # private methods
  defp _sum([], total),              do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head+total)
end

