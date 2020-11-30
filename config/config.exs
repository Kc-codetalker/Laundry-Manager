# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :laundryManager,
  ecto_repos: [LaundryManager.Repo]

# Configures the endpoint
config :laundryManager, LaundryManagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B6lSU3qnR5N85ecEnOuwDKOk7w9eNH7t6O4NY1oS2Ny/VAQNrKNgzMTAv1U36Rcb",
  render_errors: [view: LaundryManagerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LaundryManager.PubSub,
  live_view: [signing_salt: "6fKEiwaW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
