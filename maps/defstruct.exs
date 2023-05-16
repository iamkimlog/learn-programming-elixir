defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true

  def print_subscriber(%Subscriber{name: name, paid: paid, over_18: over_18}) do
    IO.puts "Name: #{name} / paid: #{paid} / over_18: #{over_18}"
  end
end
