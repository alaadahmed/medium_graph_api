defmodule MediumGraphApiWeb.Resolvers.SessionResolver do
  alias MediumGraphApi.{Accounts.Session, Guardian}

  def login_user(_, %{input: input}, _) do
    # check if the user is in our database
    # if a user is registered we want to return a token
    # we also want to return a user ofcourse
    with {:ok, user} <- Session.authenticate(input), {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt_token, user: user}}
    end
  end
end
