defmodule MediumGraphApiWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias MediumGraphApiWeb.Schema.UserType

  import_types(UserType)
end
