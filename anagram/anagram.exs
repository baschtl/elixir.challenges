defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.flat_map(candidates, fn(candidate) ->
      if have_same_length(base, candidate) && have_same_chars(base, candidate) do
        [candidate]
      else
        []
      end
    end)
  end

  defp have_same_length(a, b), do: String.length(a) == String.length(b)

  defp have_same_chars(a, b) do
    chars_of_a = String.to_char_list(a)

    Enum.all?(chars_of_a, fn(char) ->
      String.contains?(b, char)
    end)
  end

end
