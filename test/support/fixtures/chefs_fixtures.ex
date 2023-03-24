defmodule Tejst.ChefsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tejst.Chefs` context.
  """

  @doc """
  Generate a chef.
  """
  def chef_fixture(attrs \\ %{}) do
    {:ok, chef} =
      attrs
      |> Enum.into(%{
        name: "some name",
        username: "some username"
      })
      |> Tejst.Chefs.create_chef()

    chef
  end
end
