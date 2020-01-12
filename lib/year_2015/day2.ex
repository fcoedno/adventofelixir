defmodule AdventOfElixir.Year2015.Day2 do
  def solve() do
    File.read!("resources/2015/day2_input.txt")
    |> solve()
  end

  def solve(input) do
    String.split(input, "\n", trim: true)
    |> Enum.reduce(0, &calculate_paper_for_gift/2)
  end

  defp calculate_paper_for_gift(dimension_line, total) do
    calculate_paper_for_gift(dimension_line) + total
  end

  defp calculate_paper_for_gift(dimension_line) do
    parse_dimension_line(dimension_line)
    |> calculate_areas()
    |> add_slack()
    |> Enum.sum()
  end

  defp parse_dimension_line(dimension_line) do
    String.split(dimension_line, "x", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp calculate_areas([l, w, h]) do
    [2 * l * w, 2 * w * h, 2 * h * l]
  end

  defp add_slack(areas) do
    slack = Enum.min(areas) / 2
    [slack | areas]
  end
end
