defmodule UserAdmin.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
    end

    create table(:user_groups, primary_key: false) do
      add :user_id, references(:users), primary_key: true
      add :group_id, references(:groups), primary_key: true
    end
  end
end
