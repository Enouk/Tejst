defmodule Tejst.ChefsTest do
  use Tejst.DataCase

  alias Tejst.Chefs

  describe "chefs" do
    alias Tejst.Chefs.Chef

    import Tejst.ChefsFixtures

    @invalid_attrs %{name: nil, username: nil}

    test "list_chefs/0 returns all chefs" do
      chef = chef_fixture()
      assert Chefs.list_chefs() == [chef]
    end

    test "get_chef!/1 returns the chef with given id" do
      chef = chef_fixture()
      assert Chefs.get_chef!(chef.id) == chef
    end

    test "create_chef/1 with valid data creates a chef" do
      valid_attrs = %{name: "some name", username: "some username"}

      assert {:ok, %Chef{} = chef} = Chefs.create_chef(valid_attrs)
      assert chef.name == "some name"
      assert chef.username == "some username"
    end

    test "create_chef/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chefs.create_chef(@invalid_attrs)
    end

    test "update_chef/2 with valid data updates the chef" do
      chef = chef_fixture()
      update_attrs = %{name: "some updated name", username: "some updated username"}

      assert {:ok, %Chef{} = chef} = Chefs.update_chef(chef, update_attrs)
      assert chef.name == "some updated name"
      assert chef.username == "some updated username"
    end

    test "update_chef/2 with invalid data returns error changeset" do
      chef = chef_fixture()
      assert {:error, %Ecto.Changeset{}} = Chefs.update_chef(chef, @invalid_attrs)
      assert chef == Chefs.get_chef!(chef.id)
    end

    test "delete_chef/1 deletes the chef" do
      chef = chef_fixture()
      assert {:ok, %Chef{}} = Chefs.delete_chef(chef)
      assert_raise Ecto.NoResultsError, fn -> Chefs.get_chef!(chef.id) end
    end

    test "change_chef/1 returns a chef changeset" do
      chef = chef_fixture()
      assert %Ecto.Changeset{} = Chefs.change_chef(chef)
    end
  end
end
