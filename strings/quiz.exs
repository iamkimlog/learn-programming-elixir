defmodule Quiz do

  def is_printable(str_list) when is_list(str_list) do
    _is_printable(str_list)
  end

  defp _is_printable([]), do: true
  defp _is_printable([head | tail]) when head >= 32 and head <= 126, do: _is_printable(tail)
  defp _is_printable([_head | _tail]), do: false

  def anagram?(word1, word2) when is_list(word1) and is_list(word2) and length(word1) == length(word2) do
    _anagram?(Enum.sort(word1), Enum.sort(word2))
  end

  defp _anagram?([], []), do: true
  defp _anagram?([h1 | t1], [h2 | t2]) when h1 == h2, do: _anagram?(t1, t2)
  defp _anagram?(_, _), do: false

  # '123 + 27' => 150
  # '5 + 3 * 5' => 20
  # '4 / 2 - 2 * 1' => 0

  def calculate(exp) do
    _calculate(_parse_expression(exp, [], []), [], [])
  end

  defp _calculate([], [num], []), do: num

  defp _calculate([], [n1, n2 | nums], [op | ops]) do
    _calculate([], [_exec_op(n2, n1, op)] ++ nums, ops)
  end

  defp _calculate([token | _ ] = tokens, [n1, n2 | nums], [op | ops]) when token in '*/' and op in '*/' do
    _calculate(tokens, [_exec_op(n2, n1, op)] ++ nums, ops)
  end

  defp _calculate([token | t], nums, ops) when token in '*/' do
    _calculate(t, nums, [token] ++ ops)
  end

  defp _calculate([token | _] = tokens, [n1, n2 | nums], [op | ops]) when token in '+-' do
    _calculate(tokens, [_exec_op(n2, n1, op)] ++ nums, ops)
  end

  defp _calculate([token | t], nums, ops) when token in '+-' do
    _calculate(t, nums, [token] ++ ops)
  end

  defp _calculate([num | t], nums, ops), do: _calculate(t, [num] ++ nums, ops)

  defp _exec_op(x, y, op) when op in '+', do: x + y
  defp _exec_op(x, y, op) when op in '-', do: x - y
  defp _exec_op(x, y, op) when op in '*', do: x * y
  defp _exec_op(x, y, op) when op in '/', do: x / y

  defp _parse_expression([], acc, parsed) do
    parsed ++ [_to_digit(acc)]
  end

  defp _parse_expression([ s | tail ], acc, parsed) when s in ' ' do
    _parse_expression(tail, [], parsed ++ [_to_digit(acc)])
  end
  defp _parse_expression([ op, _ | tail ], _, parsed) when op in '+-*/' do
    _parse_expression(tail, [], parsed ++ [op])
  end
  defp _parse_expression([ head | tail ], acc, parsed) do
    _parse_expression(tail, acc ++ [head], parsed)
  end

  defp _to_digit(str), do: _to_digit(str, 0)
  defp _to_digit([], value), do: value
  defp _to_digit([digit | tail], value), do: _to_digit(tail, value * 10 + digit - ?0)

end
