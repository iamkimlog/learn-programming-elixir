defmodule Ok do

  def ok!({ :ok, data }), do: data
  def ok!({ :error, err }), do: raise "Error: #{err}"

end
