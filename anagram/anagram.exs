defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    filtered_candidates = filtered_candidates(base, candidates)

    do_match(base, filtered_candidates)
  end

  defp filtered_candidates(base, candidates) do
    Enum.reject(candidates, fn(candidate) ->
      String.downcase(candidate) == String.downcase(base)
    end)
  end

  defp do_match(base, candidates) do
    Enum.flat_map(candidates, fn(candidate) ->
      cond do
        equal_length?(base, candidate) && equal_chars?(base, candidate) -> [candidate]
        true -> []
      end
    end)
  end

  defp equal_length?(a, b), do: String.length(a) == String.length(b)

  defp equal_chars?(a, b) do
    chars_of_a = Enum.sort(String.codepoints(String.downcase(a)))
    chars_of_b = Enum.sort(String.codepoints(String.downcase(b)))

    chars_of_a == chars_of_b
  end

end
