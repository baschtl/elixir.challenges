defmodule InputType do

  def nothing?(input) do
    String.strip(input) == ""
  end

  def question?(input) do
    String.ends_with?(input, "?")
  end

  def yelling?(input) do
    (String.upcase(input) == input) && (String.match?(input, ~r/\p{L}/))
  end

end

defmodule Teenager do
  import InputType, only: [nothing?: 1, question?: 1, yelling?: 1]

  def hey(input) do
    cond do
      nothing?(input)  -> "Fine. Be that way!"
      question?(input) -> "Sure."
      yelling?(input)  -> "Whoa, chill out!"
      true             -> "Whatever."
    end
  end
end
