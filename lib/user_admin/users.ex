defmodule UserAdmin.Users do
  alias UserAdmin.Users.User

  @doc """
  Create a changeset to change a user.
  """
  @spec change_user(User.t(), map()) :: Ecto.Changeset.t()
  def change_user(user, changes \\ %{}) do
    User.changeset(user, changes)
  end
end
