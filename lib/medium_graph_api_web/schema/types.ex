defmodule MediumGraphApiWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias MediumGraphApiWeb.Schema.Types

  import_types(Types.UserType)
  import_types(Types.SessionType)
end
