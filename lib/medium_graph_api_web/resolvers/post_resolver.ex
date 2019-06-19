defmodule MediumGraphApiWeb.Resolvers.PostResolver do
  alias MediumGraphApi.Blog

  def posts(_, _, %{context: context}) do
    IO.inspect(context)
    {:ok, Blog.list_posts()}
  end

  def create_post(_, %{input: input}, %{current_user: current_user}) do
    IO.inspect(input)
    IO.inspect(current_user)
    # Blog.create_post(input)
  end
end
