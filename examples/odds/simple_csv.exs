#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule SimpleCsv do

  def sigil_v(lines, options) do
    separator = cond do
      ?c in options -> ","
      ?t in options -> "\t"
      true          -> ","
    end

    lines 
    |> String.rstrip 
    |> String.split("\n")
    |> Enum.map(&String.split(&1, separator))
  end

end

defmodule Example do
  import SimpleCsv

  def comma do
    ~v"""
    1,2,cat
    4,5,6,7
    linus,lucy
    """
  end

  def tab do
    ~v"""
    1\t2\tcat
    4\t5\t6\t7
    linus\tlucy
    """t
  end

end

IO.inspect Example.comma
IO.inspect Example.tab
