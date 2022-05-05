defmodule JsonAPI.Repo do
  use Ecto.Repo,
    otp_app: :jsonAPI,
    adapter: Ecto.Adapters.Postgres
end
