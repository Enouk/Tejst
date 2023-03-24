defmodule Tejst.Repo.Migrations.CreateResturants do
  use Ecto.Migration

  def change do
    create table(:resturants) do
      add :name, :string

      timestamps()
    end
  end
end
