defmodule Responser do
  def response do
    receive do
      { sender, token } ->
        send sender, { :ok, token }
        response()
    end
  end
end

defmodule Sender do
  def send do
    receive do
      { :ok, token } ->
        IO.puts token
    end
  end
end

response = spawn(Responser, :response, [])

sender1 = spawn(Sender, :send, [])
sender2 = spawn(Sender, :send, [])

send response, { sender1, "fred" }
send response, { sender2, "betty" }
