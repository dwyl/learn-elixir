#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Stats do

  def sum(vals),     do: vals |> Enum.reduce(0, &+/2)
  def count(vals),   do: vals |> length
  def average(vals), do: sum(vals) / count(vals)
end

ExUnit.start()

defmodule TestStats do
  use ExUnit.Case

  describe "Stats on lists of ints" do
    test "calculates sum" do
      list = [1, 3, 5, 7, 9]
      assert Stats.sum(list) == 25
    end

    test "calculates count" do
      list = [1, 3, 5, 7, 9]
      assert Stats.count(list) == 5
    end

    test "calculates average" do
      list = [1, 3, 5, 7, 9]
      assert Stats.average(list) == 5
    end
  end

end

defmodule TestStats1 do
  use ExUnit.Case

  describe "Stats on lists of ints" do

    setup do
      [
        list:    [1, 3, 5, 7, 9, 11],
        sum:     36,
        count:   6,
        average: 6
      ]
    end

    test "calculates sum", fixture do
      assert Stats.sum(fixture.list) == fixture.sum
    end

    test "calculates count", fixture do
      assert Stats.count(fixture.list) == fixture.count
    end

    test "calculates average", fixture do
      assert Stats.average(fixture.list) == fixture.average
    end
  end

end

ExCheck.start

defmodule TestStats2 do
  use ExUnit.Case
  use ExCheck

  describe "Stats on lists of ints" do

    property :count_not_negative do
      for_all l in list(int), do: Stats.count(l) >= 0
    end

  end
end
