defmodule UserAdmin.Users do
  alias UserAdmin.Repo
  alias UserAdmin.Users.User

  @doc """
  Create a changeset to change a user.
  """
  @spec change_user(User.t(), map()) :: Ecto.Changeset.t()
  def change_user(user, changes \\ %{}) do
    User.changeset(user, changes)
  end

  @doc """
  Create a user.
  """
  @spec create_user(map()) :: {:ok, User.t()} | {:error, Ecto.Changeset.t()}
  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
