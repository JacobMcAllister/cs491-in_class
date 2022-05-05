defmodule JsonAPIWeb.PageController do
  use JsonAPIWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
