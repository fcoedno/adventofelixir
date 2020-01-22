defmodule AdventOfElixir.Year2015.Day4Test do
  use ExUnit.Case, async: true

  alias AdventOfElixir.Year2015.TestHasher

  import AdventOfElixir.Year2015.Day4, only: [solve: 3]

  describe "fisrt part" do
    test "should mine advent of coins" do
      first_input = "abcdef"
      second_input = "pqrstuv"

      assert solve(first_input, :first_part, TestHasher) == 50
      assert solve(second_input, :first_part, TestHasher) == 47
    end
  end
end
