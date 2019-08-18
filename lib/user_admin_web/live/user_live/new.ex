defmodule UserAdminWeb.UserLive.New do
  use Phoenix.LiveView
  alias UserAdminWeb.UserView
  alias UserAdmin.Users
  alias UserAdmin.Users.User

  def mount(_session, socket) do
    changeset = Users.change_user(%User{})

    {:ok, assign(socket, changeset: changeset)}
  end

  def render(assigns) do
    UserView.render("new.html", assigns)
  end
end
