# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :medium_graph_api,
  ecto_repos: [MediumGraphApi.Repo]

# Configures the endpoint
config :medium_graph_api, MediumGraphApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iBIR3gu5ZWTQR/EQDJSIoa59ORJpadbaH3tS4WemJ9FVmAq6e2aLpPxIcd7goMMt",
  render_errors: [view: MediumGraphApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MediumGraphApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Guardian
config :medium_graph_api, MediumGraphApi.Guardian,
  issuer: "medium_graph_api",
  secret_key: "1GAj+5kMc1fl09KCLefmhajBwv8/OaDv8sESe53GxM3PHRggt+0OK6Op+VfewH9F"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
