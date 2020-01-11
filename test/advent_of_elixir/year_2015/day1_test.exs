defmodule AdventOfElixir.Year2015.Day1Test do
  use ExUnit.Case

  import AdventOfElixir.Year2015.Day1, only: [solve: 1]

  test "should go to the first floor when it reads a '(' character" do
    input = "("
    assert solve(input) == 1
  end

  test "should go to the floor -1 when it reads a ')' character" do
    input = ")"
    assert solve(input) == -1
  end

  test "should sum the instructions to reach to the final floor" do
    input = "))((((("
    assert solve(input) == 3
  end
end
