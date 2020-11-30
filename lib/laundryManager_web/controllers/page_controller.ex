defmodule LaundryManagerWeb.PageController do
  use LaundryManagerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
