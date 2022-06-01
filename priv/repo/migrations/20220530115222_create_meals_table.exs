defmodule Rocketmeal.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table :meals, primary_key: false do
      add :id, :uuid, primary_key: true, null: false
      add :description, :string
      add :consumeDate, :utc_datetime
      add :calories, :integer

      timestamps()
    end
  end
end
