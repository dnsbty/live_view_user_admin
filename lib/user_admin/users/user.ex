defmodule UserAdmin.Users.User do
  use Ecto.Schema
  alias UserAdmin.Users.{Group, Role}
  import Ecto.Changeset

  schema "users" do
    field :name, :string

    belongs_to :role, Role
    many_to_many :groups, Group, join_through: "user_groups"
  end

  def changeset(user, changes \\ %{}) do
    user
    |> cast(changes, [:name, :role_id])
    |> validate_required([:name, :role_id])
  end
end
