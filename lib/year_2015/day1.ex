defmodule AdventOfElixir.Year2015.Day1 do
  def solve(input, :first_part) do
    input
    |> parse_directions()
    |> Enum.reduce(0, &sum_direction/2)
  end

  def solve(input, :second_part) do
    input
    |> parse_directions()
    |> find_basement_position(0, 0)
  end

  defp parse_directions(input) do
    String.split(input, "", trim: true)
  end

  defp sum_direction(direction, final_floor) do
    cond do
      direction == "(" ->
        final_floor + 1

      direction == ")" ->
        final_floor - 1
    end
  end

  defp find_basement_position(_, -1, char_position) do
    char_position
  end

  defp find_basement_position([current_direction | directions], floor, char_position) do
    next_floor = sum_direction(current_direction, floor)
    find_basement_position(directions, next_floor, char_position + 1)
  end

  defp find_basement_position([], _, _) do
    nil
  end
end
