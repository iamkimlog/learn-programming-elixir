defmodule MyEnum do
  # implement 'each' function using 'reduce'
  def each(enumerable, func) do
    enumerable
    |> Enumerable.reduce({:cont, nil}, fn cur, _acc ->
      func.(cur)
      {:cont, nil}
    end)

    :ok
  end

  # implement 'filter' function using 'reduce'
  def filter(enumerable, func) do
    {:done, result} =
      enumerable
      |> Enumerable.reduce({:cont, []}, fn (cur, acc) ->
        case func.(cur) do
          true -> {:cont, acc ++ [cur]}
          false -> {:cont, acc}
        end
      end)

    result
  end

  # implement 'map' function using 'reduce'
  def map(enumerable, func) do
    {:done, result} = enumerable
    |> Enumerable.reduce({:cont, []}, fn (cur, acc) -> 
      {:cont, acc ++ [func.(cur)]} 
    end)

    result
  end
end

MyEnum.each([1, 2, 3], fn x -> IO.puts(x) end)
IO.inspect MyEnum.filter([1, 2, 3, 4], fn x -> rem(x, 2) == 0 end)
IO.inspect MyEnum.map([1, 2, 3, 4], fn x -> x * 2 end)
