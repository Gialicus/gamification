defmodule Gamification.Repo do
  use Ecto.Repo,
    otp_app: :gamification,
    adapter: Ecto.Adapters.Postgres
end
