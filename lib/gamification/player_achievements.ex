defmodule Gamification.PlayerAchievements do
  @moduledoc """
  The PlayerAchievements context.
  """

  import Ecto.Query, warn: false
  alias Gamification.Repo

  alias Gamification.PlayerAchievements.PlayerAchievement

  @doc """
  Returns the list of player_achievements.

  ## Examples

      iex> list_player_achievements()
      [%PlayerAchievement{}, ...]

  """
  def list_player_achievements do
    Repo.all(PlayerAchievement)
  end

  @doc """
  Gets a single player_achievement.

  Raises `Ecto.NoResultsError` if the Player achievement does not exist.

  ## Examples

      iex> get_player_achievement!(123)
      %PlayerAchievement{}

      iex> get_player_achievement!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player_achievement!(id), do: Repo.get!(PlayerAchievement, id)

  @doc """
  Creates a player_achievement.

  ## Examples

      iex> create_player_achievement(%{field: value})
      {:ok, %PlayerAchievement{}}

      iex> create_player_achievement(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player_achievement(attrs \\ %{}) do
    %PlayerAchievement{}
    |> PlayerAchievement.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player_achievement.

  ## Examples

      iex> update_player_achievement(player_achievement, %{field: new_value})
      {:ok, %PlayerAchievement{}}

      iex> update_player_achievement(player_achievement, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player_achievement(%PlayerAchievement{} = player_achievement, attrs) do
    player_achievement
    |> PlayerAchievement.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player_achievement.

  ## Examples

      iex> delete_player_achievement(player_achievement)
      {:ok, %PlayerAchievement{}}

      iex> delete_player_achievement(player_achievement)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player_achievement(%PlayerAchievement{} = player_achievement) do
    Repo.delete(player_achievement)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player_achievement changes.

  ## Examples

      iex> change_player_achievement(player_achievement)
      %Ecto.Changeset{data: %PlayerAchievement{}}

  """
  def change_player_achievement(%PlayerAchievement{} = player_achievement, attrs \\ %{}) do
    PlayerAchievement.changeset(player_achievement, attrs)
  end
end
