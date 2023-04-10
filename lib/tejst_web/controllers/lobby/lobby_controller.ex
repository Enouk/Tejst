defmodule TejstWeb.LobbyController do
  use TejstWeb, :controller

  def index(conn, _params) do
    render(conn, :index, layout: {TejstWeb.Layouts, :lobby})
  end

  def menus(conn, _params) do
    render(conn, :menus, layout: {TejstWeb.Layouts, :lobby})
  end

  def chefs(conn, _params) do
    render(conn, :chefs, layout: {TejstWeb.Layouts, :lobby})
  end

  def kitchen(conn, %{"kitchen_id" => "mevvas"}) do
    render(conn, :mevvas, layout: {TejstWeb.Layouts, :lobby})
  end

  def kitchen(conn, %{"kitchen_id" => "silvias"}) do
    render(conn, :silvias, layout: {TejstWeb.Layouts, :lobby})
  end
end
