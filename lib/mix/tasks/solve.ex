defmodule Mix.Tasks.Solve do
  use Mix.Task

  @shortdoc "Prints the solution to advent of code"

  def run([year, day | _]) do
    year = String.to_integer(year)
    day = String.to_integer(day)

    {first_solution, second_solution} = AdventOfElixir.solve(year, day)
    IO.puts("First part: #{first_solution}\nSecond part: #{second_solution}")
  end

  def run(_) do
    print_help_message()
  end

  defp print_help_message() do
    IO.puts("Usage: adventofelixir <year> <day>")
  end
end
