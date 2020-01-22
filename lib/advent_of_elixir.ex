defmodule AdventOfElixir do
  def solve(year, day) do
    module =
      module_name(year, day)
      |> String.to_existing_atom()

    input =
      resource_path(year, day)
      |> File.read!()

    first_solution = apply(module, :solve, [input, :first_part])
    second_solution = apply(module, :solve, [input, :second_part])

    {first_solution, second_solution}
  end

  defp module_name(year, day) do
    "Elixir.AdventOfElixir.Year#{year}.Day#{day}"
  end

  defp resource_path(year, day) do
    "resources/#{year}/day#{day}_input.txt"
  end
end
