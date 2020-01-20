defmodule AdventOfElixir.Year2015.Day3Test do
  use ExUnit.Case, async: true

  import AdventOfElixir.Year2015.Day3, only: [solve: 1]

  describe "first part" do
    test "should count the starting point only when no directions are given" do
      input = ""
      assert solve(input, :first_part) == 1
    end

    test "should count other houses when given more directions" do
      input = ">"
      assert solve(input, :first_part) == 2
    end

    test "should not count repeated houses" do
      first_input = "^>v<"
      second_input = "^v^v^v^v^v"

      assert solve(first_input, :first_part) == 4
      assert solve(second_input, :first_part) == 2
    end
  end
end
