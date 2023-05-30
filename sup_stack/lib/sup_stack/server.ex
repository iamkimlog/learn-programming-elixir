defmodule SupStack.Server do
  use GenServer
  alias SupStack.Impl

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(data) do
    GenServer.cast(__MODULE__, {:push, data})
  end

  def init(_) do
    { :ok, SupStack.Stash.get() }
  end

  def handle_call(:pop, _from, stack) do
    { head, rest } = Impl.pop(stack)
    { :reply, head, rest }
  end

  def handle_cast({:push, data}, stack) do
    { :noreply, Impl.push(data, stack)}
  end

  def terminate(_, current_stack) do
    SupStack.Stash.save(current_stack)
  end
end
