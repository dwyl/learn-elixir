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

  defimpl Access do
    use Bitwise
    def get(%Bitmap{value: value}, bit) do
      if (value &&& (1 <<< bit)) == 0, do: 0, else: 1
    end
    def get_and_update(bitmap = %Bitmap{value: value}, bit, accessor_fn) do
      old_value = get(bitmap, bit)
      new_value = accessor_fn.(old_value)
      value = (value &&& bnot( 1 <<< bit )) ||| (new_value <<< bit)
      %Bitmap{value: value}
    end
  end
end
