defmodule BracketPush do
  @brackets %{
    "(" => ")",
    "[" => "]",
    "{" => "}"
  }

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
      |> string_with_only_brackets
      |> String.codepoints
      |> do_check_brackets([])
  end

  defp string_with_only_brackets(str) do
    String.replace(str, ~r/[^\p{Ps}\p{Pe}]/, "")
  end

  defp do_check_brackets([], []), do: true
  defp do_check_brackets([], _), do: false
  defp do_check_brackets([h|t], acc) do
    cond do
      Map.has_key?(@brackets, h) ->
        do_check_brackets(t, [@brackets[h]|acc])
      !Map.has_key?(@brackets, h) && Enum.empty?(acc) ->
        false
      h != hd(acc) ->
        false
      h == hd(acc) ->
        do_check_brackets(t, tl(acc))
    end
  end
end
