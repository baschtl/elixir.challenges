defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
      |> match_string_to_encode
      |> do_encode
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
      |> match_string_to_decode
      |> do_decode
  end

  defp match_string_to_encode(string) do
    Regex.scan(~r/([A-Z])\1*/, string)
  end

  defp do_encode([]), do: ""
  defp do_encode(match_list) do
    Enum.map_join(match_list, fn ([sequence, char]) -> "#{String.length(sequence)}#{char}" end)
  end

  defp match_string_to_decode(string) do
    Regex.scan(~r/(\d+)(.)/, string)
  end

  defp do_decode(match_list) do
    Enum.map_join(match_list, fn ([_, count, char]) -> String.duplicate(char, String.to_integer(count)) end)
  end
end
