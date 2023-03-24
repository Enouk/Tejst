defmodule Tejst.RecipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tejst.Recipes` context.
  """

  @doc """
  Generate a recipe.
  """
  def recipe_fixture(attrs \\ %{}) do
    {:ok, recipe} =
      attrs
      |> Enum.into(%{
        description: "some description",
        id: 42,
        name: "some name"
      })
      |> Tejst.Recipes.create_recipe()

    recipe
  end
end
