defmodule MediumGraphApiWeb.Plugs.Context do
  @behaviour Plug
  alias MediumGraphApi.Guardian

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  defp build_context(conn) do
    with ["bearer: " <> token] <- get_req_header(conn, "authorization"),
         {:ok, claims} <- Guardian.resource_from_token(token),
         {:ok, user} <- Guardian.resource_from_claims(claims) do
      %{current_user: user}
    else
      _ -> %{}
    end
  end
end
