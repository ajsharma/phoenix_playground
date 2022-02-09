defmodule PlaygroundApplication.Repo do
  use Ecto.Repo,
    otp_app: :playground_application,
    adapter: Ecto.Adapters.Postgres
end
