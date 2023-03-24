defmodule Tejst.Chefs do
  @moduledoc """
  The Chefs context.
  """

  import Ecto.Query, warn: false
  alias Tejst.Repo

  alias Tejst.Chefs.Chef

  @doc """
  Returns the list of chefs.

  ## Examples

      iex> list_chefs()
      [%Chef{}, ...]

  """
  def list_chefs do
    Repo.all(Chef)
  end

  @doc """
  Gets a single chef.

  Raises `Ecto.NoResultsError` if the Chef does not exist.

  ## Examples

      iex> get_chef!(123)
      %Chef{}

      iex> get_chef!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chef!(id), do: Repo.get!(Chef, id)

  @doc """
  Creates a chef.

  ## Examples

      iex> create_chef(%{field: value})
      {:ok, %Chef{}}

      iex> create_chef(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chef(attrs \\ %{}) do
    %Chef{}
    |> Chef.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chef.

  ## Examples

      iex> update_chef(chef, %{field: new_value})
      {:ok, %Chef{}}

      iex> update_chef(chef, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chef(%Chef{} = chef, attrs) do
    chef
    |> Chef.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a chef.

  ## Examples

      iex> delete_chef(chef)
      {:ok, %Chef{}}

      iex> delete_chef(chef)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chef(%Chef{} = chef) do
    Repo.delete(chef)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chef changes.

  ## Examples

      iex> change_chef(chef)
      %Ecto.Changeset{data: %Chef{}}

  """
  def change_chef(%Chef{} = chef, attrs \\ %{}) do
    Chef.changeset(chef, attrs)
  end
end
