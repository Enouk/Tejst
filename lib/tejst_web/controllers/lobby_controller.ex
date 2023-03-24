defmodule TejstWeb.LobbyController do
  use TejstWeb, :controller

  def index(conn, _params) do
    render(conn, :index, layout: {TejstWeb.Layouts, :lobby})
  end

  def menus(conn, _params) do
    render(conn, :menus, layout: {TejstWeb.Layouts, :lobby})
  end
end
