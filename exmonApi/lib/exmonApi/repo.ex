defmodule ExmonApi.Repo do
  use Ecto.Repo,
    otp_app: :exmonApi,
    adapter: Ecto.Adapters.Postgres
end
