defmodule UserAdmin.Users.Role do
  use Ecto.Schema

  schema "roles" do
    field :name, :string
  end
end
