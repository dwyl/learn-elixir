defmodule Animals.Test do
  use ExUnit.Case

  test "fully exercise Animals happy path" do
    zoo = Animals.create_zoo() |> Animals.randomise()
    assert Animals.contains?(zoo, "lion")
    selection = Animals.selection(5)
    Animals.save(selection, "zoo.txt")
    loaded = Animals.load("zoo.txt")
    assert loaded == selection
  end

  test "Animals.load file that does not exist should error" do
    assert Animals.load("jungle.txt") == "File does not exist"
  end
end
