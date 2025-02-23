defmodule Gamification.PlayersLevels do
  @moduledoc """
  The PlayersLevels context.
  """

  import Ecto.Query, warn: false
  alias Gamification.Repo

  alias Gamification.PlayersLevels.PlayerLevel

  @doc """
  Returns the list of players_levels.

  ## Examples

      iex> list_players_levels()
      [%PlayerLevel{}, ...]

  """
  def list_players_levels do
    Repo.all(PlayerLevel)
  end

  @doc """
  Gets a single player_level.

  Raises `Ecto.NoResultsError` if the Player level does not exist.

  ## Examples

      iex> get_player_level!(123)
      %PlayerLevel{}

      iex> get_player_level!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player_level!(id), do: Repo.get!(PlayerLevel, id)

  @doc """
  Creates a player_level.

  ## Examples

      iex> create_player_level(%{field: value})
      {:ok, %PlayerLevel{}}

      iex> create_player_level(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player_level(attrs \\ %{}) do
    %PlayerLevel{}
    |> PlayerLevel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player_level.

  ## Examples

      iex> update_player_level(player_level, %{field: new_value})
      {:ok, %PlayerLevel{}}

      iex> update_player_level(player_level, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player_level(%PlayerLevel{} = player_level, attrs) do
    player_level
    |> PlayerLevel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player_level.

  ## Examples

      iex> delete_player_level(player_level)
      {:ok, %PlayerLevel{}}

      iex> delete_player_level(player_level)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player_level(%PlayerLevel{} = player_level) do
    Repo.delete(player_level)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player_level changes.

  ## Examples

      iex> change_player_level(player_level)
      %Ecto.Changeset{data: %PlayerLevel{}}

  """
  def change_player_level(%PlayerLevel{} = player_level, attrs \\ %{}) do
    PlayerLevel.changeset(player_level, attrs)
  end
end
