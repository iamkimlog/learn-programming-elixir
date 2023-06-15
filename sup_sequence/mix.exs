defmodule SupSequence.MixProject do
  use Mix.Project

  def project do
    [
      app: :sup_sequence,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {
        SupSequence.Application, []
      },
      registered: [
        SupSequence.Server
      ],
      env: [ initial_number: 456 ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:distillery, "~> 2.1", runtime: false}
    ]
  end
end
