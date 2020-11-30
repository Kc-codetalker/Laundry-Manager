defmodule LaundryManager.Repo do
  use Ecto.Repo,
    otp_app: :laundryManager,
    adapter: Ecto.Adapters.Postgres
end
