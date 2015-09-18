defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    filtered_candidates = base_not_in_candidates(base, candidates)

    Enum.flat_map(filtered_candidates, fn(candidate) ->
      if have_same_length(base, candidate) &&
         have_same_chars(base, candidate) do
        [candidate]
      else
        []
      end
    end)
  end

  defp base_not_in_candidates(base, candidates) do
    Enum.reject(candidates, fn(candidate) ->
      String.downcase(candidate) == String.downcase(base)
    end)
  end

  defp have_same_length(a, b), do: String.length(a) == String.length(b)

  defp have_same_chars(a, b) do
    chars_of_a = Enum.sort(String.codepoints(String.downcase(a)))
    chars_of_b = Enum.sort(String.codepoints(String.downcase(b)))

    chars_of_a == chars_of_b
  end

end
