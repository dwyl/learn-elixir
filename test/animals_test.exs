defmodule Animals.Test do
  use ExUnit.Case

  test "all quotes have author and text property" do
    zoo = Animals.create_zoo()
    assert Animals.contains?(zoo, "lion")
  end
end
