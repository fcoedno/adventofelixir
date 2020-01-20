defmodule AdventOfElixir.Year2015.Day1Test do
  use ExUnit.Case, async: true

  import AdventOfElixir.Year2015.Day1, only: [solve: 2]

  describe "first part" do
    test "should go to the first floor when it reads a '(' character" do
      input = "("
      assert solve(input, :first_part) == 1
    end

    test "should go to the floor -1 when it reads a ')' character" do
      input = ")"
      assert solve(input, :first_part) == -1
    end

    test "should sum the instructions to reach to the final floor" do
      input = "))((((("
      assert solve(input, :first_part) == 3
    end
  end

  describe "second part" do
    test "should find the character position wich forces santa to enter the basement floor the first time" do
      input = "()()))))"
      assert solve(input, :second_part) == 5
    end
  end
end
