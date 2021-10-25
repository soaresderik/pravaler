defmodule Pravaler.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Pravaler.Repo,
      # Start the Telemetry supervisor
      PravalerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Pravaler.PubSub},
      # Start the Endpoint (http/https)
      PravalerWeb.Endpoint
      # Start a worker by calling: Pravaler.Worker.start_link(arg)
      # {Pravaler.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pravaler.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PravalerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
