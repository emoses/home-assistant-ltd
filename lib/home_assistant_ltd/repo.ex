defmodule HomeAssistantLtd.Repo do
  use Ecto.Repo,
    otp_app: :home_assistant_ltd,
    adapter: Ecto.Adapters.Postgres
end
