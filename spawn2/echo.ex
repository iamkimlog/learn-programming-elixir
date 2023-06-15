defmodule Echo do
  def echo() do
    receive do
      {sender, token} ->
        send(sender, {:ok, token})
    end
  end
end

defmodule Call do
  def call do
    pid1 = spawn(Echo, :echo, [])
    pid2 = spawn(Echo, :echo, [])

    send(pid1, {self(), "fred"})
    send(pid2, {self(), "betty"})

    response()
  end

  def response do
    receive do
      {:ok, msg} ->
        IO.puts(msg)
        response()
      after 500 ->
        IO.puts "end"
    end
  end
end

Call.call()
