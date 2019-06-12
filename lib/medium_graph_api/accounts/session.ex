defmodule MediumGraphApi.Accounts.Session do
  alias MediumGraphApi.Accounts.User
  alias MediumGraphApi.Repo

  def authenticate(%{email: email, password: password}) do
    user = Repo.get_by(User, email: String.downcase(email))

    case check_password(user, password) do
      true -> {:ok, user}
      _ -> {:error, "Incorrect login credentials"}
    end
  end

  defp check_password(%User{} = user, password) do
    case user do
      nil -> Argon2.no_user_verify()
      _user -> Argon2.verify_pass(password, user.password_hash)
    end
  end
end
