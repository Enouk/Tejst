defmodule Tejst.Menus.Menu do
  use Ecto.Schema
  import Ecto.Changeset

  schema "menus" do
    field :name, :string
    field :recipe_id, :integer

    timestamps()
  end

  @doc false
  def changeset(menu, attrs) do
    menu
    |> cast(attrs, [:name, :recipe_id])
    |> validate_required([:name, :recipe_id])
  end
end
