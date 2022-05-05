defmodule InClass.Repo do
  use Ecto.Repo,
    otp_app: :in_class,
    adapter: Ecto.Adapters.Postgres
end
