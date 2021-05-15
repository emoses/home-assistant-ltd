# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :home_assistant_ltd,
  ecto_repos: [HomeAssistantLtd.Repo]

# Configures the endpoint
config :home_assistant_ltd, HomeAssistantLtdWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pWMrMUa0NyZ7KZd0K4OYF2aVr4dWHMbQGP/Xwk5/8U+t1ybJIn5UEDE7R3A9BIEJ",
  render_errors: [view: HomeAssistantLtdWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HomeAssistantLtd.PubSub,
  live_view: [signing_salt: "i0dSmYRp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
