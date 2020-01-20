defmodule AdventOfElixir.Year2015.Day2Test do
  use ExUnit.Case, async: true

  import AdventOfElixir.Year2015.Day2, only: [solve: 2]

  describe "first part" do
    test "should calculate the amount of paper for a single gift" do
      input = "2x3x4"
      assert solve(input, :first_part) == 58
    end

    test "should calculate the amount of paper for multiple gifts" do
      input = """
      2x3x4
      1x1x10
      """

      assert solve(input, :first_part) == 101
    end
  end
end
