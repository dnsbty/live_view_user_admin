defmodule UserAdmin.Users.User do
  use Ecto.Schema
  alias UserAdmin.Users.Role

  schema "users" do
    field :name, :string

    belongs_to :role, Role
  end
end
