defmodule Greeter do
  def for(name, greeting) do
    fn
      (^name) -> "#{greeting} #{name}"
      (_) -> "Who are you?"
    end
  end
end

mr_kimlog = Greeter.for("kimlog", "Hi!")

IO.puts mr_kimlog.("kimlog")    # Hi! kimlog
IO.puts mr_kimlog.("whoareyou") # Who are you?
