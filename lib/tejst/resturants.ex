defmodule Tejst.Resturants do
  @moduledoc """
  The Resturants context.
  """

  import Ecto.Query, warn: false
  alias Tejst.Repo

  alias Tejst.Resturants.Resturant

  @doc """
  Returns the list of resturants.

  ## Examples

      iex> list_resturants()
      [%Resturant{}, ...]

  """
  def list_resturants do
    Repo.all(Resturant)
  end

  @doc """
  Gets a single resturant.

  Raises `Ecto.NoResultsError` if the Resturant does not exist.

  ## Examples

      iex> get_resturant!(123)
      %Resturant{}

      iex> get_resturant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resturant!(id), do: Repo.get!(Resturant, id)

  @doc """
  Creates a resturant.

  ## Examples

      iex> create_resturant(%{field: value})
      {:ok, %Resturant{}}

      iex> create_resturant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resturant(attrs \\ %{}) do
    %Resturant{}
    |> Resturant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resturant.

  ## Examples

      iex> update_resturant(resturant, %{field: new_value})
      {:ok, %Resturant{}}

      iex> update_resturant(resturant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resturant(%Resturant{} = resturant, attrs) do
    resturant
    |> Resturant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a resturant.

  ## Examples

      iex> delete_resturant(resturant)
      {:ok, %Resturant{}}

      iex> delete_resturant(resturant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resturant(%Resturant{} = resturant) do
    Repo.delete(resturant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resturant changes.

  ## Examples

      iex> change_resturant(resturant)
      %Ecto.Changeset{data: %Resturant{}}

  """
  def change_resturant(%Resturant{} = resturant, attrs \\ %{}) do
    Resturant.changeset(resturant, attrs)
  end
end
