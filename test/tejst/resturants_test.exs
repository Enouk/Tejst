defmodule Tejst.ResturantsTest do
  use Tejst.DataCase

  alias Tejst.Resturants

  describe "resturants" do
    alias Tejst.Resturants.Resturant

    import Tejst.ResturantsFixtures

    @invalid_attrs %{}

    test "list_resturants/0 returns all resturants" do
      resturant = resturant_fixture()
      assert Resturants.list_resturants() == [resturant]
    end

    test "get_resturant!/1 returns the resturant with given id" do
      resturant = resturant_fixture()
      assert Resturants.get_resturant!(resturant.id) == resturant
    end

    test "create_resturant/1 with valid data creates a resturant" do
      valid_attrs = %{}

      assert {:ok, %Resturant{} = resturant} = Resturants.create_resturant(valid_attrs)
    end

    test "create_resturant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resturants.create_resturant(@invalid_attrs)
    end

    test "update_resturant/2 with valid data updates the resturant" do
      resturant = resturant_fixture()
      update_attrs = %{}

      assert {:ok, %Resturant{} = resturant} = Resturants.update_resturant(resturant, update_attrs)
    end

    test "update_resturant/2 with invalid data returns error changeset" do
      resturant = resturant_fixture()
      assert {:error, %Ecto.Changeset{}} = Resturants.update_resturant(resturant, @invalid_attrs)
      assert resturant == Resturants.get_resturant!(resturant.id)
    end

    test "delete_resturant/1 deletes the resturant" do
      resturant = resturant_fixture()
      assert {:ok, %Resturant{}} = Resturants.delete_resturant(resturant)
      assert_raise Ecto.NoResultsError, fn -> Resturants.get_resturant!(resturant.id) end
    end

    test "change_resturant/1 returns a resturant changeset" do
      resturant = resturant_fixture()
      assert %Ecto.Changeset{} = Resturants.change_resturant(resturant)
    end
  end
end
