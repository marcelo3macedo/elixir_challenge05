defmodule RocketmealWeb.MealControllerTest do
  use RocketmealWeb.ConnCase, async: true

  import Rocketmeal.Factory

  describe "create/2" do
    test "when all params are valid, creates the meal", %{conn: conn} do
      params = build(:meal_params)

      response = conn
      |> post(Routes.meal_path(conn, :create, params))
      |> json_response(:created)

      assert %{
        "message" => "Meal created!",
        "meal" => %{"calories" => 200, "consumeDate" => "2020-01-01T00:00:00Z", "description" => "Parmegiana de Frango", "id" => _id}
      } = response
    end

    test "when there are some error, returns the error", %{conn: conn} do
      params = %{
        description: "Parmegiana de Frango",
        consumeDate: "2020-01-01T00:00:00"
      }

      response = conn
      |> post(Routes.meal_path(conn, :create, params))
      |> json_response(:bad_request)

      expected_response = %{"message" => %{"calories" => ["can't be blank"]}}

      assert response == expected_response

    end
  end

  describe "delete/2" do
    test "when there is a meal with the given id, deletes the meal", %{conn: conn} do
      id = "86107a36-dced-11ec-9d64-0242ac120002"
      insert(:meal)

      response =
        conn
        |> delete(Routes.meal_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end

end
