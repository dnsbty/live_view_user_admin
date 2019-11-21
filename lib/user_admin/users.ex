defmodule UserAdmin.Users do
  import Ecto.Query
  alias UserAdmin.Repo
  alias UserAdmin.Users.{Group, Role, User}

  @topic inspect(__MODULE__)

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
    |> broadcast_change([:user, :created])
  end

  @doc """
  List all the groups in the database.
  """
  @spec list_groups :: list(Group.t())
  def list_groups do
    Repo.all(Group)
  end

  @doc """
  List all the roles in the database.
  """
  @spec list_roles :: list(Role.t())
  def list_roles do
    Repo.all(Role)
  end

  @doc """
  List all users in the database.
  """
  @spec list_users :: list(User.t())
  def list_users do
    User
    |> join(:inner, [u], r in assoc(u, :role))
    |> preload([_, r], role: r)
    |> Repo.all()
  end

  @doc """
  Subscribe to updates to the user list.
  """
  @spec subscribe :: :ok | {:error, term()}
  def subscribe do
    Phoenix.PubSub.subscribe(UserAdmin.PubSub, @topic)
  end

  @spec broadcast_change({:ok, User.t()}, list(atom())) :: :ok | {:error, term()}
  defp broadcast_change({:ok, result}, event) do
    Phoenix.PubSub.broadcast(UserAdmin.PubSub, @topic, {__MODULE__, event, result})

    {:ok, result}
  end
end
