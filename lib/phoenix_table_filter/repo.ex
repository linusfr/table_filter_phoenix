defmodule PhoenixTableFilter.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_table_filter,
    adapter: Ecto.Adapters.Postgres
end
