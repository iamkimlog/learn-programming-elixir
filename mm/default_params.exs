defmodule Example do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end
  def func2(p1 \\ 1, p2 \\ 2, p3, p4 \\ 4, p5 \\ 5) do
    IO.inspect [p1, p2, p3, p4, p5]
  end
end

Example.func("a", "b")
Example.func("a", "b", "c")
Example.func("a", "b", "c", "d")

# Example.func2("a", "b")
# Example.func2("a", "b", "c")
# Example.func2("a", "b", "c", "d")
