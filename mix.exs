defmodule CarReq.MixProject do
  use Mix.Project

  def project do
    [
      app: :car_req,
      elixirc_paths: elixirc_paths(Mix.env()),
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/fixtures"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # HTTP Client deps
      {:nimble_options, "~> 0.4"},
      {:req, "~> 0.3"},
      {:req_fuse, "~> 0.2"},
      # telemetry is a transient dependency through req (finch)
      # but CarReq emits telemetry, so we'll be explicit about it as a dependency.
      {:telemetry, ">= 0.0.0"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
