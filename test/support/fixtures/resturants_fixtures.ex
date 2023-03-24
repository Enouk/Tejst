defmodule Tejst.ResturantsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tejst.Resturants` context.
  """

  @doc """
  Generate a resturant.
  """
  def resturant_fixture(attrs \\ %{}) do
    {:ok, resturant} =
      attrs
      |> Enum.into(%{

      })
      |> Tejst.Resturants.create_resturant()

    resturant
  end
end
