defmodule Rocketmeal.Meals.CreateTest do
  use Rocketmeal.DataCase, async: true

  alias Rocketmeal.{Error, Meal}
  alias Rocketmeal.Meals.Create

  import Rocketmeal.Factory

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:meal_params)

      response = Create.call(params)

      assert {:ok, %Meal{}} = response
    end

    test "when are invalid params, returns an error" do
      params = %{
        description: "Parmegiana de Frango",
        consumeDate: "2020-01-01T00:00:00"
      }

      response = Create.call(params)

      {:error, %Error{result: changeset}} = response

      expected_response = %{calories: ["can't be blank"]}

      assert errors_on(changeset) == expected_response
    end
  end
end
