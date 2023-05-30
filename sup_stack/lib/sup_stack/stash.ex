defmodule SupStack.Stash do
  use GenServer

  @me __MODULE__

  def start_link(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack, name: @me)
  end

  def get() do
    GenServer.call(@me, { :get })
  end

  def save(stack) do
    GenServer.cast(@me, { :save, stack })
  end

  def init(initial_stack) do
    { :ok, initial_stack }
  end

  def handle_call({ :get }, _from, current_state) do
    { :reply, current_state, current_state }
  end

  def handle_cast({ :save, current_stack }, _) do
    { :noreply, current_stack }
  end
end
