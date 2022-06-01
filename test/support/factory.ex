defmodule Rocketmeal.Factory do
  use ExMachina.Ecto, repo: Rocketmeal.Repo

  alias Rocketmeal.Meal

  def meal_params_factory do
    %{
      description: "Parmegiana de Frango",
      consumeDate: "2020-01-01T00:00:00",
      calories: 200
    }
  end

  def meal_factory do
    %Meal{
      description: "Parmegiana de Frango",
      consumeDate: "2020-01-01T00:00:00",
      calories: 200,
      id: "86107a36-dced-11ec-9d64-0242ac120002"
    }
  end

end
