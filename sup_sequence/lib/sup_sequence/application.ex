defmodule SupSequence.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      { SupSequence.Stash, Application.get_env(:sup_sequence, :initial_number)},
      { SupSequence.Server, nil },
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: SupSequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
