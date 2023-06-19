defmodule Ticker do
  @interval 2000
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send(:global.whereis_name(@name), {:register, client_pid})
  end

  def generator(clients, next_client) do
    receive do
      {:register, pid} ->
        IO.puts("registering #{inspect(pid)}")
        new_clients = clients ++ [pid]
        new_next_client = if next_client == nil, do: pid, else: next_client
        generator(new_clients, new_next_client)

      {:tick, _sender} = msg ->
        send(next_client, msg)
        generator(clients, next_client)
    end
  end
end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      { :tick, next_client } ->
        IO.puts "tock in client"
        Process.send_after(next_client, {:tick, next_client}, Ticker.interval)
        receiver()
    end
  end
end
