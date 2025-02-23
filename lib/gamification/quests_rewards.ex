defmodule Gamification.QuestsRewards do
  @moduledoc """
  The QuestsRewards context.
  """

  import Ecto.Query, warn: false
  alias Gamification.Repo

  alias Gamification.QuestsRewards.QuestReward

  @doc """
  Returns the list of quests_rewards.

  ## Examples

      iex> list_quests_rewards()
      [%QuestReward{}, ...]

  """
  def list_quests_rewards do
    Repo.all(QuestReward)
  end

  @doc """
  Gets a single quest_reward.

  Raises `Ecto.NoResultsError` if the Quest reward does not exist.

  ## Examples

      iex> get_quest_reward!(123)
      %QuestReward{}

      iex> get_quest_reward!(456)
      ** (Ecto.NoResultsError)

  """
  def get_quest_reward!(id), do: Repo.get!(QuestReward, id)

  @doc """
  Creates a quest_reward.

  ## Examples

      iex> create_quest_reward(%{field: value})
      {:ok, %QuestReward{}}

      iex> create_quest_reward(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_quest_reward(attrs \\ %{}) do
    %QuestReward{}
    |> QuestReward.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a quest_reward.

  ## Examples

      iex> update_quest_reward(quest_reward, %{field: new_value})
      {:ok, %QuestReward{}}

      iex> update_quest_reward(quest_reward, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_quest_reward(%QuestReward{} = quest_reward, attrs) do
    quest_reward
    |> QuestReward.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a quest_reward.

  ## Examples

      iex> delete_quest_reward(quest_reward)
      {:ok, %QuestReward{}}

      iex> delete_quest_reward(quest_reward)
      {:error, %Ecto.Changeset{}}

  """
  def delete_quest_reward(%QuestReward{} = quest_reward) do
    Repo.delete(quest_reward)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking quest_reward changes.

  ## Examples

      iex> change_quest_reward(quest_reward)
      %Ecto.Changeset{data: %QuestReward{}}

  """
  def change_quest_reward(%QuestReward{} = quest_reward, attrs \\ %{}) do
    QuestReward.changeset(quest_reward, attrs)
  end
end
