defmodule TejstWeb.ChefHTML do
  use TejstWeb, :html

  embed_templates "chef_html/*"

  @doc """
  Renders a chef form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def chef_form(assigns)
end
