defmodule CsvSigil do
  def sigil_v(lines, _opts) do
    lines
    |> String.trim_trailing()
    |> String.split("\n")
    |> parse_csv_lines()
  end

  defp parse_csv_lines([header_line | value_lines]) do
    header =
      header_line
      |> String.split(",")
      |> Enum.map(&String.to_atom/1)

    parse_csv_lines(header, value_lines, [])
  end

  defp parse_csv_lines(_header, [], acc), do: Enum.reverse(acc)

  defp parse_csv_lines(header, [line | lines], acc) do
    parsed =
      header
      |> Enum.zip(parse_line(line))

    parse_csv_lines(header, lines, [parsed | acc])
  end

  defp parse_line(line) do
    line
    |> String.split(",")
    |> Enum.map(&parse_cell/1)
  end

  defp parse_cell(cell) do
    case {cell =~ ~r{\d+\.\d+}, cell =~ ~r{^\d$}} do
      {true, false} ->
        {float, _} = Float.parse(cell)
        float

      {false, true} ->
        {int, _} = Integer.parse(cell)
        int

      {_, _} ->
        cell
    end
  end
end

defmodule Test do
  import CsvSigil

  def csv do
    ~v"""
    Item,Qty,Price
    Teddy bear,4,34.95
    Milk,1,2.99
    Battery,6,8.00
    """
  end

  def csv2 do
    ~v"""
    Code,Product,Qty,Price
    D,Teddy bear,4,34.95
    F,Milk,1,2.99
    E,Battery,6,8.00
    F,Coffee,10,12.11
    """
  end
end

IO.inspect(Test.csv())
IO.inspect(Test.csv2())
