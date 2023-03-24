defmodule Tejst.Repo.Migrations.CreateChefs do
  use Ecto.Migration

  def change do
    create table(:chefs) do
      add :username, :string
      add :name, :string

      timestamps()
    end
  end
end
