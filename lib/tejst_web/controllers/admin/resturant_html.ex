defmodule TejstWeb.ResturantHTML do
  use TejstWeb, :html

  embed_templates "resturant_html/*"

  @doc """
  Renders a resturant form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def resturant_form(assigns)
end
