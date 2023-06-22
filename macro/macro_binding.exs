defmodule Bind do
  defmacro mydef(name) do
    quote bind_quoted: [name: name] do
      def unquote(name)(), do: unquote(name)
    end
  end
end

defmodule Test do
  require Bind
  [ :fred, :bert ] |> Enum.each(&Bind.mydef(&1))
end

IO.puts Test.fred()
