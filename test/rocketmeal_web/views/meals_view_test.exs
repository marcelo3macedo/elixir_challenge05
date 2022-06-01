defmodule RocketmealWeb.MealsViewTest do
  use RocketmealWeb.ConnCase, async: true

  import Phoenix.View
  import Rocketmeal.Factory
  alias Rocketmeal.Meal
  alias RocketmealWeb.MealView

  test "renders create.json" do
    meal = build(:meal)

    response = render(MealView, "create.json", meal: meal)

    expected_response = %{meal: %Meal{calories: 200, consumeDate: "2020-01-01T00:00:00", description: "Parmegiana de Frango", id: "86107a36-dced-11ec-9d64-0242ac120002", inserted_at: nil, updated_at: nil}, message: "Meal created!"}

    assert response == expected_response
  end
end
