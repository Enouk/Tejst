defmodule TejstWeb.GalleryController do
  use TejstWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
