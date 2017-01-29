#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule StatsPropertyTest do
  use ExUnit.Case
  use ExCheck

  describe "Stats on lists of ints" do

    property "count not negative" do
      for_all l in list(int), do: Stats.count(l) >= 0
    end

    property "single element lists are their own sum" do
      for_all number in real do
        Stats.sum([number]) == number
      end
    end

    property "sum equals average times count" do
      for_all l in list(int) do
        abs(Stats.sum(l) - Stats.count(l) * Stats.average(l)) < 1.0e-6
      end
    end

    property "sum equals average times count (implies)" do
      for_all l in list(int) do
        implies length(l) > 0 do
          abs(Stats.sum(l) - Stats.count(l) * Stats.average(l)) < 1.0e-6
        end
      end
    end

    property "sum equals average times count (such_that)" do
      for_all l in such_that(l in list(int) when length(l) > 0) do
        abs(Stats.sum(l) - Stats.count(l) * Stats.average(l)) < 1.0e-6
      end
    end
    

  end
end
