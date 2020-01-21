defmodule AdventOfElixir.Year2015.Day3 do
  import Integer, only: [is_odd: 1, is_even: 1]

  def solve(input, :first_part) do
    input
    |> parse_directions()
    |> apply_directions()
    |> count_visited_houses()
  end

  def solve(input, :second_part) do
    {santa_directions, robot_directions} =
      input
      |> parse_directions()
      |> split_directions()

    houses_visited_by_santa =
      santa_directions
      |> apply_directions()

    houses_visited_by_robot =
      robot_directions
      |> apply_directions()

    (houses_visited_by_santa ++ houses_visited_by_robot)
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

  defp split_directions(directions) do
    split_directions(directions, 0, {[], []})
  end

  defp split_directions([cur_direction | tail], iteration, {santa_directions, robot_directions})
       when is_even(iteration) do
    split_directions(tail, iteration + 1, {[cur_direction | santa_directions], robot_directions})
  end

  defp split_directions([cur_direction | tail], iteration, {santa_directions, robot_directions})
       when is_odd(iteration) do
    split_directions(tail, iteration + 1, {santa_directions, [cur_direction | robot_directions]})
  end

  defp split_directions([], _, {santa_directions, robot_directions}) do
    {Enum.reverse(santa_directions), Enum.reverse(robot_directions)}
  end
end
