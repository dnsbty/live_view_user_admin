defmodule UserAdminWeb.PageController do
  use UserAdminWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
