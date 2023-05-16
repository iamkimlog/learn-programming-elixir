defmodule FizzBuzz do
  def upto(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)

  defp fizzbuzz(n), do: _fizzbuzz(n, rem(n, 3), rem(n, 5))

  defp _fizzbuzz(_n, 0, 0), do: "FizzBuzz"
  defp _fizzbuzz(_n, 0, _0), do: "Fizz"
  defp _fizzbuzz(_n, _0, 0), do: "Buzz"
  defp _fizzbuzz(n, _, _), do: n
end
