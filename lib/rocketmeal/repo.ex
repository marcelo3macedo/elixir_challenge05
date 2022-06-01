defmodule Rocketmeal.Repo do
  use Ecto.Repo,
    otp_app: :rocketmeal,
    adapter: Ecto.Adapters.Postgres
end
