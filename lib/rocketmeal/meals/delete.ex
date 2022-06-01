defmodule Rocketmeal.Meals.Delete do
  alias Rocketmeal.{Error, Meal, Repo}

  def call(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      meal -> Repo.delete(meal)
    end
  end

end
