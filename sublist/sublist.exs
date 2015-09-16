defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b        -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true           -> :unequal
    end
  end

  defp sublist?(a, b) when length(a) <= length(b) do
    cond do
      a === Enum.take(b, length(a)) -> true
      true -> sublist?(a, tl(b))
    end
  end
  defp sublist?(_, _), do: false

end
