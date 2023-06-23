defmodule Tracer do
  def dump_args(args) do
    args |> Enum.map(&inspect/1) |> Enum.join(", ")
  end

  def dump_defn(name, args) do
    "#{name}(#{dump_args(args)})"
  end

  def trace(msg, %{ :background => background }) do
    IO.puts(IO.ANSI.format([background, msg]))
  end

  defmacro def(definition={name,_,args}, do: content) do
    quote do
      Kernel.def(unquote(definition)) do
        # 매크로가 호출될 때 전달된 name, args 를 출력하기 위해 unquote 가 사용됨.
        Tracer.trace("==> call: #{Tracer.dump_defn(unquote(name), unquote(args))}", %{ :background => :blue_background})
        result = unquote(content) 

        # result 는 이미 평가된 값이기 때문에 unquote 를 사용하지 않음.
        Tracer.trace("<== result: #{result}", %{ :background => :green_background})
        result
      end
    end
  end

  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [def: 2]
      import unquote(__MODULE__), only: [def: 2]
    end
  end
end

defmodule Test do
  use Tracer

  def puts_sum_three(a, b, c), do: IO.inspect(a + b + c)
  def add_list(list), do: Enum.reduce(list, 0, &(&1 + &2))
end

Test.puts_sum_three(1,2,3)
Test.add_list([5,6,7,8])

# puts_sum_three 함수에 when is_number(a) 를 붙이면 트레이싱이 동작하지 않는다.
# 매크로는 컴파일 타임에 실행되는 반면 가드 조건절은 런타임에 동작하는 코드이다. 
# 그래서 동작하지 않는 것 같다.
