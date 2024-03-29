defmodule Rocketmeal.Meals.Get do
  alias Rocketmeal.{Error, Meal, Repo}

  def by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      meal -> {:ok, meal}
    end
  end

end
