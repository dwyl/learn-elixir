#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Greeter do

  def for(name, greeting) do
    fn
      (^name) -> "Hello #{name}!, #{greeting}"
      (_)     -> "I don't know you."
    end
  end

end

mr_valim = Greeter.for("josé", "Oi!")

IO.puts mr_valim.("josé")
IO.puts mr_valim.("dave")

