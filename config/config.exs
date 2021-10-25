# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pravaler,
  ecto_repos: [Pravaler.Repo]

# Configures the endpoint
config :pravaler, PravalerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q71UO7d157r2CrXAB9PgG88v/lre9BYYJknF2yYMgb1v3r1J0LvUtBiRazw65sU5",
  render_errors: [view: PravalerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Pravaler.PubSub,
  live_view: [signing_salt: "be5FVZx3"]

config :pravaler, Pravaler.Mailer, adapter: Bamboo.LocalAdapter

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
