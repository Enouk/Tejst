defmodule Tejst.Resturants.Resturant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "resturants" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(resturant, attrs) do
    resturant
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
