defmodule RocketmealWeb.MealController do
  use RocketmealWeb, :controller

  alias Rocketmeal.Meal
  alias RocketmealWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Rocketmeal.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Rocketmeal.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def update(conn, params) do
    with {:ok, %Meal{} = meal} <- Rocketmeal.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Meal{}} <- Rocketmeal.delete_meal(id) do
      conn
      |> put_status(:no_content)
      |> text('')
    end
  end
end
