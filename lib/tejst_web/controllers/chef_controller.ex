defmodule TejstWeb.ChefController do
  use TejstWeb, :controller

  alias Tejst.Chefs
  alias Tejst.Chefs.Chef

  def index(conn, _params) do
    chefs = Chefs.list_chefs()
    render(conn, :index, chefs: chefs)
  end

  def new(conn, _params) do
    changeset = Chefs.change_chef(%Chef{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"chef" => chef_params}) do
    case Chefs.create_chef(chef_params) do
      {:ok, chef} ->
        conn
        |> put_flash(:info, "Chef created successfully.")
        |> redirect(to: ~p"/chefs/#{chef}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    chef = Chefs.get_chef!(id)
    render(conn, :show, chef: chef)
  end

  def edit(conn, %{"id" => id}) do
    chef = Chefs.get_chef!(id)
    changeset = Chefs.change_chef(chef)
    render(conn, :edit, chef: chef, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chef" => chef_params}) do
    chef = Chefs.get_chef!(id)

    case Chefs.update_chef(chef, chef_params) do
      {:ok, chef} ->
        conn
        |> put_flash(:info, "Chef updated successfully.")
        |> redirect(to: ~p"/chefs/#{chef}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, chef: chef, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chef = Chefs.get_chef!(id)
    {:ok, _chef} = Chefs.delete_chef(chef)

    conn
    |> put_flash(:info, "Chef deleted successfully.")
    |> redirect(to: ~p"/chefs")
  end
end
