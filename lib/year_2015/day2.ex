defmodule AdventOfElixir.Year2015.Day2 do
  def solve(input, :first_part) do
    input
    |> parse_input()
    |> Enum.reduce(0, &calculate_paper_for_gift/2)
  end

  def solve(input, :second_part) do
    input
    |> parse_input()
    |> Enum.reduce(0, &calculate_ribbon_for_gift/2)
  end

  defp parse_input(input) do
    String.split(input, "\n", trim: true)
  end

  defp calculate_paper_for_gift(dimension_line, total) do
    calculate_paper_for_gift(dimension_line) + total
  end

  defp calculate_paper_for_gift(dimension_line) do
    dimension_line
    |> parse_dimension_line()
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

  defp calculate_ribbon_for_gift(dimension_line, total) do
    dimensions = dimension_line
    |> parse_dimension_line()
    |> Enum.sort(&(&1 >= &2))


    ribbon_area = Enum.sum(tl(dimensions)) * 2
    bow_area = Enum.reduce(dimensions, 1.0, &*/2)

    total + ribbon_area + bow_area
  end
end
