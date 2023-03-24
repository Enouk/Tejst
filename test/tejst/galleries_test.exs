defmodule Tejst.GalleriesTest do
  use Tejst.DataCase

  alias Tejst.Galleries

  describe "gallery" do
    alias Tejst.Galleries.Gallery

    import Tejst.GalleriesFixtures

    @invalid_attrs %{}

    test "list_gallery/0 returns all gallery" do
      gallery = gallery_fixture()
      assert Galleries.list_gallery() == [gallery]
    end

    test "get_gallery!/1 returns the gallery with given id" do
      gallery = gallery_fixture()
      assert Galleries.get_gallery!(gallery.id) == gallery
    end

    test "create_gallery/1 with valid data creates a gallery" do
      valid_attrs = %{}

      assert {:ok, %Gallery{} = gallery} = Galleries.create_gallery(valid_attrs)
    end

    test "create_gallery/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Galleries.create_gallery(@invalid_attrs)
    end

    test "update_gallery/2 with valid data updates the gallery" do
      gallery = gallery_fixture()
      update_attrs = %{}

      assert {:ok, %Gallery{} = gallery} = Galleries.update_gallery(gallery, update_attrs)
    end

    test "update_gallery/2 with invalid data returns error changeset" do
      gallery = gallery_fixture()
      assert {:error, %Ecto.Changeset{}} = Galleries.update_gallery(gallery, @invalid_attrs)
      assert gallery == Galleries.get_gallery!(gallery.id)
    end

    test "delete_gallery/1 deletes the gallery" do
      gallery = gallery_fixture()
      assert {:ok, %Gallery{}} = Galleries.delete_gallery(gallery)
      assert_raise Ecto.NoResultsError, fn -> Galleries.get_gallery!(gallery.id) end
    end

    test "change_gallery/1 returns a gallery changeset" do
      gallery = gallery_fixture()
      assert %Ecto.Changeset{} = Galleries.change_gallery(gallery)
    end
  end
end
