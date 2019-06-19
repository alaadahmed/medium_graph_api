defmodule MediumGraphApi.Accounts.Session do
  alias MediumGraphApi.Accounts.User
  alias MediumGraphApi.Repo

  def authenticate(params) do
    user = Repo.get_by(User, email: String.downcase(params.email))

    case check_password(user, params) do
      true -> {:ok, user}
      _ -> {:error, "Incorrect login credentials"}
    end
  end

  defp check_password(%User{} = user, params) do
    case user do
      nil -> Comeonin.Argon2.dummy_checkpw()
      _ -> Argon2.verify_pass(params.password, user.password_hash)
    end
  end
end
