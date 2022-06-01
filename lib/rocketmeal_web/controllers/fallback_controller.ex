defmodule RocketmealWeb.FallbackController do
  use RocketmealWeb, :controller

  alias Rocketmeal.Error
  alias RocketmealWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
