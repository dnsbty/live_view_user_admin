defmodule UserAdmin.Repo do
  use Ecto.Repo,
    otp_app: :user_admin,
    adapter: Ecto.Adapters.Postgres
end
