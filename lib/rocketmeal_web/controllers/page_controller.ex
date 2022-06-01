defmodule RocketmealWeb.PageController do
  use RocketmealWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
