defmodule Quiz3 do
  def capitalize_sentences(sentence) do
    IO.puts String.split(sentence, ". ")
      |> Enum.map(&(String.capitalize &1))
      |> Enum.join(". ")
  end

  # "./strings/sample.txt"
  def parse_csv(csv_file) do
    keys = _parse_csv_keys(csv_file)
    IO.stream(csv_file, :line)
      |> Enum.map(&(_parse_csv_data(&1)))
      |> Enum.map(&(Enum.zip keys, &1))
  end

  defp _parse_csv_keys(csv_file) do
    String.trim(IO.read(csv_file, :line))
      |> String.split(",")
      |> Enum.map(&(String.to_atom(&1)))
  end

  defp _parse_csv_data(line) do
    String.split(line, ",")
      |> Enum.map(&(String.trim(&1)))
      |> Enum.map(&(_parse_value(&1)))
  end

  defp _parse_value(data) do
    if Regex.match?(~r/:.+/, data) do
      String.to_atom(String.replace(data, ":", ""))
    else
      if Regex.match?(~r/\d+\.\d+/, data) do
        String.to_float(data)
      else
        String.to_integer(data)
      end
    end
  end

  def handle_fileopen(file_path) do
    res = File.open(file_path)
    if {:ok, file} = res do
      file
    else
      { _, e } = res
      raise "Error: #{:file.format_error(e)}"
    end
  end
end

defmodule CalculateTax do
  def calc(order_list, tax_rates) when is_list(order_list) and is_list(tax_rates) do
    for order <- order_list, do: order ++ [ total_amount: calc(order[:net_amount], tax_rates[order[:ship_to]])]
  end

  def calc(net_amount, nil), do: net_amount
  def calc(net_amount, tax_rate), do: net_amount * (1 + tax_rate)

  def tax_rates do
    [ NC: 0.075, TX: 0.08 ]
  end
end

orders = Quiz3.parse_csv(Quiz3.handle_fileopen("./strings/sample.txt"))
IO.inspect CalculateTax.calc(orders, CalculateTax.tax_rates())
