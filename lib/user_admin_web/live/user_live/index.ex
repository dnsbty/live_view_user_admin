defmodule UserAdminWeb.UserLive.Index do
  use Phoenix.LiveView
  alias UserAdmin.Users
  alias UserAdminWeb.UserView

  def mount(_session, socket) do
    Users.subscribe()
    users = Users.list_users()

    {:ok, assign(socket, :users, users)}
  end

  def render(assigns) do
    UserView.render("index.html", assigns)
  end

  def handle_info({Users, [:user | _], _}, socket) do
    users = Users.list_users()
    {:noreply, assign(socket, users: users)}
  end
end
