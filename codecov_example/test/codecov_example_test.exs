defmodule CodecovExampleTest do
  use ExUnit.Case
  doctest CodecovExample

  describe "testing the add functions in CodecovExample" do
    test "adds one" do
      assert CodecovExample.add_one(10) == 11
    end

    test "adds two" do
      assert CodecovExample.add_two(10) == 12
    end

    test "adds three" do
      assert CodecovExample.add_three(10) == 13
    end
  end
end
