defmodule MediumGraphApiWeb.Router do
  use MediumGraphApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MediumGraphApiWeb do
    pipe_through :api
  end
end
