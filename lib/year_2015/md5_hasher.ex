defmodule AdventOfElixir.Year2015.Md5Hasher do
  alias AdventOfElixir.Year2015.Hasher

  @behaviour Hasher

  @impl Hasher
  def hash(input) do
    :crypto.hash(:md5, input)
    |> Base.encode16()
  end
end
