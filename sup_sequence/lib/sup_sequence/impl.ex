defmodule SupSequence.Impl do
  @spec next(number) :: number
  def next(number),             do: number + 1
  def increment(number, delta), do: number + delta
end
