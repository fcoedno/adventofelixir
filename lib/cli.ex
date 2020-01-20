defmodule AdventOfElixir.CLI do
  def main([year, day | _]) do
    IO.puts handle(year, day)
  end

  def main(_) do
    print_help_message()
  end

  defp handle(year, day) do
    year = String.to_integer(year)
    day = String.to_integer(day)

    module_name(year, day)
    |> String.to_existing_atom()
    |> apply(:solve, [])
  end

  defp module_name(year, day) do
    "Elixir.AdventOfElixir.Year#{year}.Day#{day}"
  end

  defp print_help_message() do
    IO.puts "Usage: adventofelixir <year> <day>"
  end
end
