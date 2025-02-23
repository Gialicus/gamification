defmodule Gamification.ActiveQuests do
  @moduledoc """
  The ActiveQuests context.
  """

  import Ecto.Query, warn: false
  alias Gamification.Repo

  alias Gamification.ActiveQuests.ActiveQuest

  @doc """
  Returns the list of active_quests.

  ## Examples

      iex> list_active_quests()
      [%ActiveQuest{}, ...]

  """
  def list_active_quests do
    Repo.all(ActiveQuest)
  end

  @doc """
  Gets a single active_quest.

  Raises `Ecto.NoResultsError` if the Active quest does not exist.

  ## Examples

      iex> get_active_quest!(123)
      %ActiveQuest{}

      iex> get_active_quest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_active_quest!(id), do: Repo.get!(ActiveQuest, id)

  @doc """
  Creates a active_quest.

  ## Examples

      iex> create_active_quest(%{field: value})
      {:ok, %ActiveQuest{}}

      iex> create_active_quest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_active_quest(attrs \\ %{}) do
    %ActiveQuest{}
    |> ActiveQuest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a active_quest.

  ## Examples

      iex> update_active_quest(active_quest, %{field: new_value})
      {:ok, %ActiveQuest{}}

      iex> update_active_quest(active_quest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_active_quest(%ActiveQuest{} = active_quest, attrs) do
    active_quest
    |> ActiveQuest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a active_quest.

  ## Examples

      iex> delete_active_quest(active_quest)
      {:ok, %ActiveQuest{}}

      iex> delete_active_quest(active_quest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_active_quest(%ActiveQuest{} = active_quest) do
    Repo.delete(active_quest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking active_quest changes.

  ## Examples

      iex> change_active_quest(active_quest)
      %Ecto.Changeset{data: %ActiveQuest{}}

  """
  def change_active_quest(%ActiveQuest{} = active_quest, attrs \\ %{}) do
    ActiveQuest.changeset(active_quest, attrs)
  end
end
