defmodule TejstWeb.ResturantController do
  use TejstWeb, :controller

  alias Tejst.Resturants
  alias Tejst.Resturants.Resturant

  def index(conn, _params) do
    resturants = Resturants.list_resturants()
    render(conn, :index, resturants: resturants)
  end

  def new(conn, _params) do
    changeset = Resturants.change_resturant(%Resturant{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"resturant" => resturant_params}) do
    case Resturants.create_resturant(resturant_params) do
      {:ok, resturant} ->
        conn
        |> put_flash(:info, "Resturant created successfully.")
        |> redirect(to: ~p"/resturants/#{resturant}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resturant = Resturants.get_resturant!(id)
    render(conn, :show, resturant: resturant)
  end

  def edit(conn, %{"id" => id}) do
    resturant = Resturants.get_resturant!(id)
    changeset = Resturants.change_resturant(resturant)
    render(conn, :edit, resturant: resturant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resturant" => resturant_params}) do
    resturant = Resturants.get_resturant!(id)

    case Resturants.update_resturant(resturant, resturant_params) do
      {:ok, resturant} ->
        conn
        |> put_flash(:info, "Resturant updated successfully.")
        |> redirect(to: ~p"/resturants/#{resturant}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, resturant: resturant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resturant = Resturants.get_resturant!(id)
    {:ok, _resturant} = Resturants.delete_resturant(resturant)

    conn
    |> put_flash(:info, "Resturant deleted successfully.")
    |> redirect(to: ~p"/resturants")
  end
end
