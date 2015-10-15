defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  def count('', _), do: 0

  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.count(strand, &(&1 == nucleotide))
  end

  @spec nucleotide_counts([char]) :: Dict.t
  def nucleotide_counts(strand) do
    Enum.map(@nucleotides, &{&1, count(strand, &1)}) |> Enum.into(%{})
  end
end
