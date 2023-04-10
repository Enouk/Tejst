defmodule TejstWeb.MenuController do
  use TejstWeb, :controller

  alias Tejst.Menus
  alias Tejst.Menus.Menu

  def index(conn, _params) do
    menus = Menus.list_menus()
    render(conn, :index, menus: menus)
  end

  def new(conn, _params) do
    changeset = Menus.change_menu(%Menu{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"menu" => menu_params}) do
    case Menus.create_menu(menu_params) do
      {:ok, menu} ->
        conn
        |> put_flash(:info, "Menu created successfully.")
        |> redirect(to: ~p"/menus/#{menu}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    menu = Menus.get_menu!(id)
    render(conn, :show, menu: menu)
  end

  def edit(conn, %{"id" => id}) do
    menu = Menus.get_menu!(id)
    changeset = Menus.change_menu(menu)
    render(conn, :edit, menu: menu, changeset: changeset)
  end

  def update(conn, %{"id" => id, "menu" => menu_params}) do
    menu = Menus.get_menu!(id)

    case Menus.update_menu(menu, menu_params) do
      {:ok, menu} ->
        conn
        |> put_flash(:info, "Menu updated successfully.")
        |> redirect(to: ~p"/menus/#{menu}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, menu: menu, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    menu = Menus.get_menu!(id)
    {:ok, _menu} = Menus.delete_menu(menu)

    conn
    |> put_flash(:info, "Menu deleted successfully.")
    |> redirect(to: ~p"/menus")
  end
end
