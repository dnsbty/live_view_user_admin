defmodule UserAdmin.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :role_id, references("roles")
    end
  end
end
