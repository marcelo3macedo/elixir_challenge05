defmodule Rocketmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @required_params [:description, :consumeDate, :calories]

  @derive {Jason.Encoder, only: [:id, :description, :consumeDate, :calories]}

  schema "meals" do
    field :description, :string
    field :consumeDate, :utc_datetime
    field :calories, :integer

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
