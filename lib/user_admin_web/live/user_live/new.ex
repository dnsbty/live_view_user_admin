defmodule UserAdminWeb.UserLive.New do
  use Phoenix.LiveView
  alias UserAdminWeb.UserView
  alias UserAdmin.Users
  alias UserAdmin.Users.User
  alias UserAdminWeb.Router.Helpers, as: Routes

  def mount(_session, socket) do
    changeset = Users.change_user(%User{})
    roles = Users.list_roles()

    {:ok, assign(socket, changeset: changeset, roles: roles)}
  end

  def render(assigns) do
    UserView.render("new.html", assigns)
  end

  def handle_event("create", %{"user" => attrs}, socket) do
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
end
