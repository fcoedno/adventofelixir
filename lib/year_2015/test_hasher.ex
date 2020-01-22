defmodule AdventOfElixir.Year2015.TestHasher do
  alias AdventOfElixir.Year2015.Hasher

  @behaviour Hasher

  def hash("abcdef50") do
    "000001DBBFA3A5C83A2D506429C7B00E"
  end

  def hash("pqrstuv47") do
    "000006136EF2FF3B291C85725F17325C"
  end

  @impl Hasher
  def hash(_input) do
    "asdfgh"
  end
end
