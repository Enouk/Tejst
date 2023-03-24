defmodule Tejst.Repo.Migrations.CreateMenus do
  use Ecto.Migration

  def change do
    create table(:menus) do
      add :name, :string
      add :recipe_id, :integer

      timestamps()
    end
  end
end
