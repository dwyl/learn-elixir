#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Bitmap do
  defstruct value: 0

  defimpl Inspect, for: Bitmap do
    import Inspect.Algebra
    def inspect(%Bitmap{value: value}, _opts) do
      concat([
        nest(
         concat([
           "%Bitmap{",
           break(""),
           nest(concat([to_string(value),
                        "=", 
                        break(""), 
                        as_binary(value)]), 
                2),
         ]), 2),
        break(""),
        "}"])
    end
    defp as_binary(value) do
      to_string(:io_lib.format("~.2B", [value]))
    end
  end
end

big_bitmap = %Bitmap{value: 12345678901234567890}

IO.inspect big_bitmap
IO.inspect big_bitmap, structs: false

