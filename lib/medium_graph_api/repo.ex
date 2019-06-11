defmodule MediumGraphApi.Repo do
  use Ecto.Repo,
    otp_app: :medium_graph_api,
    adapter: Ecto.Adapters.Postgres
end
