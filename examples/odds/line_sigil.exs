#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule LineSigil do
  @doc """
  Implement the `~l` sigil, which takes a string containing
  multiple lines and returns a list of those lines.

  ## Example usage

      iex> import LineSigil
      nil
      iex> ~l\"""
      ...> one
      ...> two
      ...> three
      ...> \"""
      ["one","two","three"]
  """
  def sigil_l(lines, _opts) do
    lines |> String.rstrip |> String.split("\n")
  end
end

defmodule Example do
  import LineSigil

  def lines do
    ~l"""
    line 1
    line 2
    and another line in #{__MODULE__}
    """
  end
end

IO.inspect Example.lines
