defmodule Mix.Tasks.Solve do
  use Mix.Task

  @shortdoc "Prints the solution to advent of code"

  def run([year, day | _]) do
    IO.puts(handle(year, day))
  end

  def run(_) do
    print_help_message()
  end

  defp handle(year, day) do
    year = String.to_integer(year)
    day = String.to_integer(day)

    module =
      module_name(year, day)
      |> String.to_existing_atom()

    input =
      resource_path(year, day)
      |> File.read!()

    first_solution = apply(module, :solve, [input, :first_part])
    second_solution = apply(module, :solve, [input, :second_part])

    IO.puts("First part: #{first_solution}\nSecond part: #{second_solution}")
  end

  defp module_name(year, day) do
    "Elixir.AdventOfElixir.Year#{year}.Day#{day}"
  end

  defp resource_path(year, day) do
    "resources/#{year}/day#{day}_input.txt"
  end

  defp print_help_message() do
    IO.puts("Usage: adventofelixir <year> <day>")
  end
end
