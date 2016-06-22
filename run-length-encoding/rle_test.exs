if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("rle.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule RunLengthEncoderTest do
  use ExUnit.Case

  test "empty string returns empty" do
    assert RunLengthEncoder.encode("") === ""
  end

  test "simple string gets encoded" do
    assert RunLengthEncoder.encode("AAA") === "3A"
  end

  test "more complicated string" do
    assert RunLengthEncoder.encode("HORSE") == "1H1O1R1S1E"
  end

  test "an even more complex string" do
    assert RunLengthEncoder.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") === "12W1B12W3B24W1B"
  end

  test "it decodes an encoded simple string" do
    assert RunLengthEncoder.decode("3A") === "AAA"
  end

  test "it decodes a more complicated string" do
    assert RunLengthEncoder.decode("12W1B12W3B24W1B") === "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
  end
end
