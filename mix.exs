defmodule MinecraftAdmin.MixProject do
  use Mix.Project

  def project do
    [
      app: :minecraft_admin,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        minecraft_admin: [
          include_executables_for: [:unix],
          applications: [runtime_tools: :permanent],
          strip_beams: false
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {MinecraftAdmin.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:observer_cli, "~> 1.5"},
      {:nostrum, "~> 0.4"}
    ]
  end
end
