defmodule SupStack.Impl do
  def pop([head | rest]) do
    { head, rest }
  end

  def push(value, stack) do
    [value] ++ stack
  end
end
