defmodule Tejst.Chefs.Chef do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chefs" do
    field :name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(chef, attrs) do
    chef
    |> cast(attrs, [:username, :name])
    |> validate_required([:username, :name])
  end
end
