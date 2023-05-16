defmodule MyList do
  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def reduce([], value, _func), do: value
  def reduce([head | tail], initial_value, func), do: reduce(tail, func.(head, initial_value), func)

  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max([head]), do: head
  def max([head | [next | tail]]) when head > next, do: max([head | tail])
  def max([_head | tail]), do: max(tail)

  def caesar([], _n), do: ''
  def caesar([head | tail], n) when head + n > 122, do: [ head + n - 26 | caesar(tail, n)]
  def caesar([head | tail], n), do: [ head + n | caesar(tail, n)]

  # def max([], value), do: value
  # def max([head | tail]), do: reduce(tail, head, &compare/2)
  # def compare(x1, x2) when x1 >= x2, do: x1
  # def compare(x1, x2) when x1 < x2, do: x2

  # def max([head | tail]), do: MyList.max(tail, head)
  # def max([head | tail], value) when head >= value, do: MyList.max(tail, head)
  # def max([head | tail], value) when head < value, do: MyList.max(tail, value)

  def span(from, to) when from > to, do: []
  def span(from, to) when from <= to, do: [from | span(from + 1, to)]

  def all?([], _func), do: true
  def all?([head | tail], func) when is_function(func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], _func), do: :ok
  def each([head | tail], func) when is_function(func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func), do: []
  def filter([head | tail], func) when is_function(func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split(list, count) when is_list(list) and is_number(count) do
    split(list, count, { [], [] })
  end

  defp split([], _count, result), do: result

  defp split(list, count, result) when count < 0 and abs(count) <= length(list) do
    split(list, length(list) + count, result)
  end

  defp split([head | tail], count, { left, right }) when length(left) < count do
    split(tail, count, { left ++ [head], right })
  end

  defp split([head | tail], count, { left, right }) when length(left) >= count do
    split(tail, count, { left, right ++ [head] })
  end


  def take(list, amount) when is_list(list) and is_number(amount), do: take(list, amount, [])

  defp take([], _amount, result), do: result
  defp take(_list, amount, result) when abs(amount) === length(result), do: result

  defp take([_head | tail] = list, amount, result) when amount < 0 and abs(amount) < length(list) do
    take(tail, amount, result)
  end

  defp take([head | tail], amount, result) do
    take(tail, amount, result ++ [head])
  end


  def flatten(list) when is_list(list), do: flatten(list, [])

  defp flatten([], result), do: result
  defp flatten([head | tail], result) when is_list(head) do
    flatten(tail, flatten(head, result))
  end
  defp flatten([head | tail], result), do: flatten(tail, result ++ [head])


  def len(list), do: _len(list, 0)
  defp _len([], count), do: count
  defp _len([_head | tail], count), do: _len(tail, count + 1)

  def print_prime_numbers(n) when is_number(n) and n >= 2 do
    numbers = span(2, n)
    numbers -- (for x <- numbers, y <- numbers, x > y, rem(x, y) === 0, do: x)
  end
end
