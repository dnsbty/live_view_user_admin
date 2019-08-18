defmodule UserAdmin.Users.User do
  use Ecto.Schema
  alias UserAdmin.Users.Role
  import Ecto.Changeset

  schema "users" do
    field :name, :string

    belongs_to :role, Role
  end

  def changeset(user, changes \\ %{}) do
    user
    |> cast(changes, [:name, :role_id])
    |> validate_required([:name, :role_id])
  end
end
