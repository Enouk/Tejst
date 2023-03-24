defmodule TejstWeb.MenuHTML do
  use TejstWeb, :html

  embed_templates "menu_html/*"

  @doc """
  Renders a menu form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def menu_form(assigns)
end
