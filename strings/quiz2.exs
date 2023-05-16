defmodule Quiz do
  def center(str_list) when is_list(str_list) do
    max_length = Enum.max_by(str_list, &(String.length(&1)))
      |> String.length

    Enum.map(str_list, &(_center_word(&1, max_length)))
      |> Enum.each(&(IO.puts &1))
  end

  defp _center_word(str, max_length) do
    str_len = String.length str
    String.pad_leading(str, trunc(str_len + (max_length - str_len) / 2))
  end
end
