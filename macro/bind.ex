defmodule Bind do
  defmacro mydef(name) do
    quote do
      def unquote(name)(), do: unquote(name)
    end
  end
end

defmodule Test do
  require Bind

  # Bind.mydef(:some_name)
  [ :fred, :bert ]
  |> Enum.each(&Bind.mydef(&1))
end

IO.puts Test.fred()

# ** (CompileError) bind.ex:14: invalid syntax in def x1()
# 이런 오류가 난다.
# 매크로는 컴파일 타임에 실행되는데, Enum.each 는 런타임에 실행된다.
# 따라서 매크로가 호출되는 시점에는 Enum.each 가 아직 실행되지 않은 상태이기 때문에
# 전달할 수 있는 이름이 없는 것.

# IO.puts Test.some_name()
