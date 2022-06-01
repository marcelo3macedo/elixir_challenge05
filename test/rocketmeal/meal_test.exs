defmodule Rocketmeal.MealTest do
  use Rocketmeal.DataCase, async: true

  import Rocketmeal.Factory

  alias Ecto.Changeset
  alias Rocketmeal.Meal

  describe "changeset/2" do
    test "when all parameters are valid, returns a valid changeset" do
      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{changes: %{description: "Parmegiana de Frango"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset" do
      params = build(:meal_params)

      update_params = %{description: "Bananinha"}

      response =
        params
        |> Meal.changeset()
        |> Meal.changeset(update_params)

      assert %Changeset{changes: %{description: "Bananinha"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        description: "Parmegiana de Frango",
        consumeDate: "2020-01-01T00:00:00"
      }

      response = Meal.changeset(params)

      assert %Changeset{changes: %{}, valid?: false} = response

    end
  end
end
