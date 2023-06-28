defmodule LineSigil do
  def sigil_l(lines, _opts) do
    lines |> String.trim_trailing() |> String.split("\n")
  end

  def sigil_L(lines, _opts) do
    lines |> String.trim_trailing() |> String.split("\n")
  end
end

defmodule Example do
  import LineSigil

  def lines do
    ~l"""
    line1
    line2
    and another line in #{__MODULE__}
    """
  end

  def lines_upper do
    ~L"""
    line1
    line2
    and another line in #{__MODULE__}
    """
  end
end

IO.inspect Example.lines()
IO.inspect Example.lines_upper()
