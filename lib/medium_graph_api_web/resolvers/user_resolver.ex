defmodule MediumGraphApiWeb.Resolvers.UserResolver do
  alias MediumGraphApi.Accounts

  def users(_, %{context: context}, _) do
    IO.inspect(context)
    {:ok, Accounts.list_users()}
  end

  def register_user(_, %{input: input}, _) do
    Accounts.create_user(input)
  end
end
