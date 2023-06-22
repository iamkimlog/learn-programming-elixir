defmodule My do
  def myif(condition, clauses) do
    do_clause = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)

    IO.puts "hello"

    case condition do
      val when val in [false, nil] -> else_clause
      _ -> do_clause
    end
  end
end
