defmodule TejstWeb.GalleryControllerTest do
  use TejstWeb.ConnCase

  import Tejst.GalleriesFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  describe "index" do
    test "lists all gallery", %{conn: conn} do
      conn = get(conn, ~p"/gallery")
      assert html_response(conn, 200) =~ "Listing Gallery"
    end
  end

  describe "new gallery" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/gallery/new")
      assert html_response(conn, 200) =~ "New Gallery"
    end
  end

  describe "create gallery" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/gallery", gallery: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/gallery/#{id}"

      conn = get(conn, ~p"/gallery/#{id}")
      assert html_response(conn, 200) =~ "Gallery #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/gallery", gallery: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Gallery"
    end
  end

  describe "edit gallery" do
    setup [:create_gallery]

    test "renders form for editing chosen gallery", %{conn: conn, gallery: gallery} do
      conn = get(conn, ~p"/gallery/#{gallery}/edit")
      assert html_response(conn, 200) =~ "Edit Gallery"
    end
  end

  describe "update gallery" do
    setup [:create_gallery]

    test "redirects when data is valid", %{conn: conn, gallery: gallery} do
      conn = put(conn, ~p"/gallery/#{gallery}", gallery: @update_attrs)
      assert redirected_to(conn) == ~p"/gallery/#{gallery}"

      conn = get(conn, ~p"/gallery/#{gallery}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, gallery: gallery} do
      conn = put(conn, ~p"/gallery/#{gallery}", gallery: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Gallery"
    end
  end

  describe "delete gallery" do
    setup [:create_gallery]

    test "deletes chosen gallery", %{conn: conn, gallery: gallery} do
      conn = delete(conn, ~p"/gallery/#{gallery}")
      assert redirected_to(conn) == ~p"/gallery"

      assert_error_sent 404, fn ->
        get(conn, ~p"/gallery/#{gallery}")
      end
    end
  end

  defp create_gallery(_) do
    gallery = gallery_fixture()
    %{gallery: gallery}
  end
end
