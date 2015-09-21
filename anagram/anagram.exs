defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, &anagram?(&1, base))
  end

  defp anagram?(candidate, base) do
    do_anagram(String.downcase(candidate), String.downcase(base))
  end

  defp do_anagram(a, a), do: false
  defp do_anagram(a, b), do: hash_for(a) === hash_for(b)

  defp hash_for(word), do: word |> String.codepoints |> Enum.sort

end
