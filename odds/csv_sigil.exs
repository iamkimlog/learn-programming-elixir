defmodule CsvSigil do
  def sigil_v(lines, _opts) do
    lines
    |> String.trim_trailing()
    |> String.split("\n")
    |> Enum.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.split(",")
    |> Enum.map(&parse_cell/1)
  end

  defp parse_cell(cell) do
    case Float.parse(cell) do
      {float, ""} -> float
      :error -> cell
    end
  end
end

defmodule Test do
  import CsvSigil

  def lines do
    ~v"""
    1,2,3
    cat,dog
    """
  end

  def lines2 do
    ~v"""
    1,2,3.14
    cat,dog
    """
  end
end

IO.inspect(Test.lines())
IO.inspect(Test.lines2())
