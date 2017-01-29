#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule WeatherHistory do

  def test_data do
    [
     [1366225622, 26, 15, 0.125],
     [1366225622, 27, 15, 0.45],
     [1366225622, 28, 21, 0.25],
     [1366229222, 26, 19, 0.081],
     [1366229222, 27, 17, 0.468],
     [1366229222, 28, 15, 0.60],
     [1366232822, 26, 22, 0.095],
     [1366232822, 27, 21, 0.05],
     [1366232822, 28, 24, 0.03],
     [1366236422, 26, 17, 0.025]
    ]
  end

  def for_location([], target_loc), do: []
  def for_location([ head | tail], target_loc) do
    case head do
      [ _, ^target_loc, _, _ ] -> [ head | for_location(tail, target_loc) ]
      _                        -> for_location(tail, target_loc)
    end                                  
  end


end
