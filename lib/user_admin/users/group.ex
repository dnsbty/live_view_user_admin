defmodule UserAdmin.Users.Group do
  @moduledoc """
  Schema for the "groups" table
  """

  use Ecto.Schema

  schema "groups" do
    field :name, :string
  end
end
