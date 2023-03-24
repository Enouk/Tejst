defmodule TejstWeb.ChefControllerTest do
  use TejstWeb.ConnCase

  import Tejst.ChefsFixtures

  @create_attrs %{name: "some name", username: "some username"}
  @update_attrs %{name: "some updated name", username: "some updated username"}
  @invalid_attrs %{name: nil, username: nil}

  describe "index" do
    test "lists all chefs", %{conn: conn} do
      conn = get(conn, ~p"/chefs")
      assert html_response(conn, 200) =~ "Listing Chefs"
    end
  end

  describe "new chef" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/chefs/new")
      assert html_response(conn, 200) =~ "New Chef"
    end
  end

  describe "create chef" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/chefs", chef: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/chefs/#{id}"

      conn = get(conn, ~p"/chefs/#{id}")
      assert html_response(conn, 200) =~ "Chef #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/chefs", chef: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Chef"
    end
  end

  describe "edit chef" do
    setup [:create_chef]

    test "renders form for editing chosen chef", %{conn: conn, chef: chef} do
      conn = get(conn, ~p"/chefs/#{chef}/edit")
      assert html_response(conn, 200) =~ "Edit Chef"
    end
  end

  describe "update chef" do
    setup [:create_chef]

    test "redirects when data is valid", %{conn: conn, chef: chef} do
      conn = put(conn, ~p"/chefs/#{chef}", chef: @update_attrs)
      assert redirected_to(conn) == ~p"/chefs/#{chef}"

      conn = get(conn, ~p"/chefs/#{chef}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, chef: chef} do
      conn = put(conn, ~p"/chefs/#{chef}", chef: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Chef"
    end
  end

  describe "delete chef" do
    setup [:create_chef]

    test "deletes chosen chef", %{conn: conn, chef: chef} do
      conn = delete(conn, ~p"/chefs/#{chef}")
      assert redirected_to(conn) == ~p"/chefs"

      assert_error_sent 404, fn ->
        get(conn, ~p"/chefs/#{chef}")
      end
    end
  end

  defp create_chef(_) do
    chef = chef_fixture()
    %{chef: chef}
  end
end
