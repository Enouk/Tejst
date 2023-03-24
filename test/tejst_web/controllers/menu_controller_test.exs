defmodule TejstWeb.MenuControllerTest do
  use TejstWeb.ConnCase

  import Tejst.MenusFixtures

  @create_attrs %{name: "some name", recipe_id: 42}
  @update_attrs %{name: "some updated name", recipe_id: 43}
  @invalid_attrs %{name: nil, recipe_id: nil}

  describe "index" do
    test "lists all menus", %{conn: conn} do
      conn = get(conn, ~p"/menus")
      assert html_response(conn, 200) =~ "Listing Menus"
    end
  end

  describe "new menu" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/menus/new")
      assert html_response(conn, 200) =~ "New Menu"
    end
  end

  describe "create menu" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/menus", menu: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/menus/#{id}"

      conn = get(conn, ~p"/menus/#{id}")
      assert html_response(conn, 200) =~ "Menu #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/menus", menu: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Menu"
    end
  end

  describe "edit menu" do
    setup [:create_menu]

    test "renders form for editing chosen menu", %{conn: conn, menu: menu} do
      conn = get(conn, ~p"/menus/#{menu}/edit")
      assert html_response(conn, 200) =~ "Edit Menu"
    end
  end

  describe "update menu" do
    setup [:create_menu]

    test "redirects when data is valid", %{conn: conn, menu: menu} do
      conn = put(conn, ~p"/menus/#{menu}", menu: @update_attrs)
      assert redirected_to(conn) == ~p"/menus/#{menu}"

      conn = get(conn, ~p"/menus/#{menu}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, menu: menu} do
      conn = put(conn, ~p"/menus/#{menu}", menu: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Menu"
    end
  end

  describe "delete menu" do
    setup [:create_menu]

    test "deletes chosen menu", %{conn: conn, menu: menu} do
      conn = delete(conn, ~p"/menus/#{menu}")
      assert redirected_to(conn) == ~p"/menus"

      assert_error_sent 404, fn ->
        get(conn, ~p"/menus/#{menu}")
      end
    end
  end

  defp create_menu(_) do
    menu = menu_fixture()
    %{menu: menu}
  end
end
