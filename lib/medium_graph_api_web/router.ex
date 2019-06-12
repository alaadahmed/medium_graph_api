defmodule MediumGraphApiWeb.Router do
  use MediumGraphApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: MediumGraphApiWeb.Schema

    if Mix.env() == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL, schema: MediumGraphApiWeb.Schema
    end
  end
end
