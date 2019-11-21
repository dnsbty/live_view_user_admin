defmodule UserAdminWeb.UserLive.New do
  use Phoenix.LiveView
  alias UserAdminWeb.UserView
  alias UserAdmin.Users
  alias UserAdmin.Users.User
  alias UserAdminWeb.Router.Helpers, as: Routes

  def mount(_session, socket) do
    changeset = Users.change_user(%User{groups: []})
    roles = Users.list_roles()
    groups = Users.list_groups()

    {:ok, assign(socket, changeset: changeset, groups: groups, roles: roles)}
  end

  def render(assigns) do
    UserView.render("new.html", assigns)
  end

  def handle_event("create", %{"user" => attrs}, socket) do
    groups = groups_from_ids(socket.assigns.groups, attrs["group_ids"])
    attrs = Map.put(attrs, "groups", groups)

    case Users.create_user(attrs) do
      {:ok, _user} ->
        socket =
          socket
          |> put_flash(:info, "User successfully created")
          |> redirect(to: Routes.live_path(socket, __MODULE__))

        {:noreply, socket}

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp groups_from_ids(groups, ids) do
    Enum.map(ids, fn id ->
      Enum.find(groups, fn group -> inspect(group.id) == id end)
    end)
  end
end
