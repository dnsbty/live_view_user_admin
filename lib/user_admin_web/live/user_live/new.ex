defmodule UserAdminWeb.UserLive.New do
  use Phoenix.LiveView
  alias UserAdminWeb.UserView

  def mount(_session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    UserView.render("new.html", assigns)
  end
end
