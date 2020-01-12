defmodule AdventOfElixir.Year2015.Day3 do
  def solve() do
    File.read!("resources/2015/day3_input.txt")
    |> solve()
  end

  def solve(input) do
    input
    |> parse_directions()
    |> apply_directions()
    |> count_visited_houses()
  end

  defp parse_directions(input), do: String.split(input, "", trim: true)

  defp apply_directions(directions) do
    Enum.reduce(directions, [{0, 0}], fn direction, visited_houses ->
      next_house =
        visited_houses
        |> hd()
        |> move_to_next_house(direction)

      [next_house | visited_houses]
    end)
  end

  defp move_to_next_house({x, y}, direction) do
    case direction do
      ">" -> {x + 1, y}
      "<" -> {x - 1, y}
      "^" -> {x, y + 1}
      "v" -> {x, y - 1}
    end
  end

  defp count_visited_houses(visited_houses) do
    visited_houses
    |> Enum.uniq()
    |> Enum.count()
  end
end
