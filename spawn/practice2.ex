defmodule Practice2 do
  import :timer, only: [ sleep: 1 ]

  def tell_parent(pid) do
    send pid, { :ok, :rand.uniform(10) }
    exit(:bye)
  end

  def run do
    for _n <- 1..100, do: spawn_link(Practice2, :tell_parent, [self()])

    sleep 500
    
    loop_receive()
  end

  def loop_receive do
    receive do
      { :ok, number } -> 
        IO.puts "Number: #{number}"
        loop_receive()
    end
  end

end

Practice2.run
