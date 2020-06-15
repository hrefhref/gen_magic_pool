defmodule GenMagic.Pool.MixProject do
  use Mix.Project

  def project do
    [
      app: :gen_magic_pool,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:gen_magic, github: "hrefhref/gen_magic", optional: true},
      {:nimble_pool, "~> 0.1"}
    ]
  end
end
