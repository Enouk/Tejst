defmodule Tejst.GalleriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tejst.Galleries` context.
  """

  @doc """
  Generate a gallery.
  """
  def gallery_fixture(attrs \\ %{}) do
    {:ok, gallery} =
      attrs
      |> Enum.into(%{

      })
      |> Tejst.Galleries.create_gallery()

    gallery
  end
end
