defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence             |>
      String.downcase    |>
      remove_punctuation |>
      String.split       |>
      word_counts
  end

  defp remove_punctuation(sentence) do
    String.replace(sentence, ~r/[!@,:%&\$\^_]/ , " ")
  end

  defp word_counts(words) do

    Enum.reduce(words, %{}, fn(word, map) ->
      Dict.update(map, word, 1, &(&1 + 1))
    end)

  end

end
