defmodule RocketmealWeb.MealView do
  use RocketmealWeb, :view

  alias Rocketmeal.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created!",
      meal: meal
    }
  end

  def render("meal.json", %{meal: %Meal{} = meal}), do: %{meal: meal}
end
