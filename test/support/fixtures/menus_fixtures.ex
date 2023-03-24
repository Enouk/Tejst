defmodule Tejst.MenusFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tejst.Menus` context.
  """

  @doc """
  Generate a menu.
  """
  def menu_fixture(attrs \\ %{}) do
    {:ok, menu} =
      attrs
      |> Enum.into(%{
        name: "some name",
        recipe_id: 42
      })
      |> Tejst.Menus.create_menu()

    menu
  end
end
