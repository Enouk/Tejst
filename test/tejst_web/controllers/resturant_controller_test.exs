defmodule TejstWeb.ResturantControllerTest do
  use TejstWeb.ConnCase

  import Tejst.ResturantsFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  describe "index" do
    test "lists all resturants", %{conn: conn} do
      conn = get(conn, ~p"/resturants")
      assert html_response(conn, 200) =~ "Listing Resturants"
    end
  end

  describe "new resturant" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/resturants/new")
      assert html_response(conn, 200) =~ "New Resturant"
    end
  end

  describe "create resturant" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/resturants", resturant: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/resturants/#{id}"

      conn = get(conn, ~p"/resturants/#{id}")
      assert html_response(conn, 200) =~ "Resturant #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/resturants", resturant: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Resturant"
    end
  end

  describe "edit resturant" do
    setup [:create_resturant]

    test "renders form for editing chosen resturant", %{conn: conn, resturant: resturant} do
      conn = get(conn, ~p"/resturants/#{resturant}/edit")
      assert html_response(conn, 200) =~ "Edit Resturant"
    end
  end

  describe "update resturant" do
    setup [:create_resturant]

    test "redirects when data is valid", %{conn: conn, resturant: resturant} do
      conn = put(conn, ~p"/resturants/#{resturant}", resturant: @update_attrs)
      assert redirected_to(conn) == ~p"/resturants/#{resturant}"

      conn = get(conn, ~p"/resturants/#{resturant}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, resturant: resturant} do
      conn = put(conn, ~p"/resturants/#{resturant}", resturant: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Resturant"
    end
  end

  describe "delete resturant" do
    setup [:create_resturant]

    test "deletes chosen resturant", %{conn: conn, resturant: resturant} do
      conn = delete(conn, ~p"/resturants/#{resturant}")
      assert redirected_to(conn) == ~p"/resturants"

      assert_error_sent 404, fn ->
        get(conn, ~p"/resturants/#{resturant}")
      end
    end
  end

  defp create_resturant(_) do
    resturant = resturant_fixture()
    %{resturant: resturant}
  end
end
