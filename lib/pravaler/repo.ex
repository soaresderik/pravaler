defmodule Pravaler.Repo do
  use Ecto.Repo,
    otp_app: :pravaler,
    adapter: Ecto.Adapters.Postgres
end
