defmodule AdventOfElixir.Year2015.Day4 do
  alias AdventOfElixir.Year2015.Md5Hasher

  def solve(input, atom, hasher \\ Md5Hasher)

  def solve(input, :first_part, hasher) do
    input
    |> mine_advent_coin(hasher)
  end

  def solve(input, :second_part, hasher) do
    input
    |> mine_advent_coin6(hasher)
  end

  defp mine_advent_coin(secret_key, hasher) do
    mine_advent_coin(secret_key, 0, "", hasher)
  end

  defp mine_advent_coin(_secret_key, last_number, "00000" <> _, _) do
    last_number
  end

  defp mine_advent_coin(secret_key, last_number, _last_hash, hasher) do
    number = last_number + 1
    hash = calculate_hash(secret_key, number, hasher)
    mine_advent_coin(secret_key, number, hash, hasher)
  end

  defp mine_advent_coin6(secret_key, hasher) do
    mine_advent_coin6(secret_key, 0, "", hasher)
  end

  defp mine_advent_coin6(_secret_key, last_number, "000000" <> _, _) do
    last_number
  end

  defp mine_advent_coin6(secret_key, last_number, _last_hash, hasher) do
    number = last_number + 1
    hash = calculate_hash(secret_key, number, hasher)
    mine_advent_coin6(secret_key, number, hash, hasher)
  end

  defp calculate_hash(secret_key, number, hasher) do
    hasher.hash("#{secret_key}#{number}")
  end
end
