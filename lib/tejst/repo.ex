defmodule Tejst.Repo do
  use Ecto.Repo,
    otp_app: :tejst,
    adapter: Ecto.Adapters.Postgres
end
