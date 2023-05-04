defmodule RumblWeb.MixProject do
  use Mix.Project

  def project do
    [
      app: :rumbl_web,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.14.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {RumblWeb.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.9"},
      {:phoenix_ecto, "~> 4.2.1"},
      {:phoenix_html, "~> 2.14.3"},
      {:phoenix_live_reload, "~> 1.3.1", only: :dev},
      {:phoenix_live_dashboard, "~> 0.4.0"},
      {:telemetry_metrics, "~> 0.6.0"},
      {:telemetry_poller, "~> 0.5.1"},
      {:gettext, "~> 0.18.2"},
      {:rumbl, in_umbrella: true},
      {:jason, "~> 1.2.2"},
      {:plug_cowboy, "~> 2.5.0"},
      {:info_sys, in_umbrella: true}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
