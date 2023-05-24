defmodule Practice4 do
  import :timer, only: [ sleep: 1 ]

  def tell_parent(pid) do
    send pid, { :ok, :rand.uniform(10) }
    exit(:bye)
  end

  def run do
    for _n <- 1..3 do 
      res = spawn_monitor(Practice4, :tell_parent, [self()])
      IO.puts inspect res
    end 

    sleep 500
    
    loop_receive()
  end

  def loop_receive do
    receive do
      { :ok, number } -> 
        IO.puts "Number: #{number}"
        loop_receive()
      msg -> 
        IO.puts "Message received: #{inspect msg}"
        loop_receive()
      after 500 ->
        IO.puts "exit!"
    end
  end

end

Practice4.run
