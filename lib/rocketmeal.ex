defmodule Rocketmeal do
  alias Rocketmeal.Meals.Create, as: MealCreate
  alias Rocketmeal.Meals.Delete, as: MealDelete
  alias Rocketmeal.Meals.Get, as: MealGet
  alias Rocketmeal.Meals.Update, as: MealUpdate

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate delete_meal(id), to: MealDelete, as: :call
  defdelegate get_meal_by_id(id), to: MealGet, as: :by_id
  defdelegate update_meal(id), to: MealUpdate, as: :call
end
