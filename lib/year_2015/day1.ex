defmodule AdventOfElixir.Year2015.Day1 do
  def solve() do
    File.read!("resources/2015/day1_input.txt")
    |> solve()
  end

  def solve(input) do
    String.split(input, "", trim: true)
    |> Enum.reduce(0, &sum_direction/2)
  end

  defp sum_direction(direction, final_floor) do
      cond do
        direction == "(" ->
          final_floor + 1

        direction == ")" ->
          final_floor - 1
      end
  end
end
