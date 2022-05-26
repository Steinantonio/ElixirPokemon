# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :exmonApi,
  ecto_repos: [ExmonApi.Repo]

# Configures the endpoint
config :exmonApi, ExmonApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wr5o100zLJVMet8KcqulCxdVii8xmPAVKPfdKUpsd3TPD9P2TUq28mHnq4y2Pdls",
  render_errors: [view: ExmonApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExmonApi.PubSub,
  live_view: [signing_salt: "OY8pUpEh"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :ExmonApi, ExmonApiWeb.Auth.Guardian,
       issuer: "ExmonApi",
       secret_key: "LvFW1H4XWCKon3e54xZgBQ3CeoV7Ot/4xHVb9eVbMehhC1qcEAj+EZktWSZkL+rh"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
