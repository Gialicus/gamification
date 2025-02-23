defmodule Gamification.QuestsRewardsTest do
  use Gamification.DataCase

  alias Gamification.QuestsRewards

  describe "quests_rewards" do
    alias Gamification.QuestsRewards.QuestReward

    import Gamification.QuestsRewardsFixtures

    @invalid_attrs %{expire_at: nil}

    test "list_quests_rewards/0 returns all quests_rewards" do
      quest_reward = quest_reward_fixture()
      assert QuestsRewards.list_quests_rewards() == [quest_reward]
    end

    test "get_quest_reward!/1 returns the quest_reward with given id" do
      quest_reward = quest_reward_fixture()
      assert QuestsRewards.get_quest_reward!(quest_reward.id) == quest_reward
    end

    test "create_quest_reward/1 with valid data creates a quest_reward" do
      valid_attrs = %{expire_at: ~U[2025-02-22 23:20:00Z]}

      assert {:ok, %QuestReward{} = quest_reward} = QuestsRewards.create_quest_reward(valid_attrs)
      assert quest_reward.expire_at == ~U[2025-02-22 23:20:00Z]
    end

    test "create_quest_reward/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = QuestsRewards.create_quest_reward(@invalid_attrs)
    end

    test "update_quest_reward/2 with valid data updates the quest_reward" do
      quest_reward = quest_reward_fixture()
      update_attrs = %{expire_at: ~U[2025-02-23 23:20:00Z]}

      assert {:ok, %QuestReward{} = quest_reward} = QuestsRewards.update_quest_reward(quest_reward, update_attrs)
      assert quest_reward.expire_at == ~U[2025-02-23 23:20:00Z]
    end

    test "update_quest_reward/2 with invalid data returns error changeset" do
      quest_reward = quest_reward_fixture()
      assert {:error, %Ecto.Changeset{}} = QuestsRewards.update_quest_reward(quest_reward, @invalid_attrs)
      assert quest_reward == QuestsRewards.get_quest_reward!(quest_reward.id)
    end

    test "delete_quest_reward/1 deletes the quest_reward" do
      quest_reward = quest_reward_fixture()
      assert {:ok, %QuestReward{}} = QuestsRewards.delete_quest_reward(quest_reward)
      assert_raise Ecto.NoResultsError, fn -> QuestsRewards.get_quest_reward!(quest_reward.id) end
    end

    test "change_quest_reward/1 returns a quest_reward changeset" do
      quest_reward = quest_reward_fixture()
      assert %Ecto.Changeset{} = QuestsRewards.change_quest_reward(quest_reward)
    end
  end
end
