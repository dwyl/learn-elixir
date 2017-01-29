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

  @doc """
  A simple accessor for the 2^bit value in an integer

      iex> b = %Bitmap{value: 5}
      %Bitmap{value: 5}
      iex> Bitmap.fetch_bit(b,2)
      1
      iex> Bitmap.fetch_bit(b,1)
      0
      iex> Bitmap.fetch_bit(b,0)
      1
  """
  def fetch_bit(%Bitmap{value: value}, bit) do
    use Bitwise

    (value >>> bit) &&& 1
  end
end
