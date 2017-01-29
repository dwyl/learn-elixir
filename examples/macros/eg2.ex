#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule My do
  defmacro macro(code) do
    IO.inspect code
    quote do
      IO.puts(unquote(code))
    end
  end
end

defmodule Test do
  require My

  My.macro(1 + 2)
end
