defmodule Gamification.QuestsTest do
  use Gamification.DataCase

  alias Gamification.Quests

  describe "quests" do
    alias Gamification.Quests.Quest

    import Gamification.QuestsFixtures

    @invalid_attrs %{name: nil, description: nil, points_rewarded: nil}

    test "list_quests/0 returns all quests" do
      quest = quest_fixture()
      assert Quests.list_quests() == [quest]
    end

    test "get_quest!/1 returns the quest with given id" do
      quest = quest_fixture()
      assert Quests.get_quest!(quest.id) == quest
    end

    test "create_quest/1 with valid data creates a quest" do
      valid_attrs = %{name: "some name", description: "some description", points_rewarded: 42}

      assert {:ok, %Quest{} = quest} = Quests.create_quest(valid_attrs)
      assert quest.name == "some name"
      assert quest.description == "some description"
      assert quest.points_rewarded == 42
    end

    test "create_quest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quests.create_quest(@invalid_attrs)
    end

    test "update_quest/2 with valid data updates the quest" do
      quest = quest_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", points_rewarded: 43}

      assert {:ok, %Quest{} = quest} = Quests.update_quest(quest, update_attrs)
      assert quest.name == "some updated name"
      assert quest.description == "some updated description"
      assert quest.points_rewarded == 43
    end

    test "update_quest/2 with invalid data returns error changeset" do
      quest = quest_fixture()
      assert {:error, %Ecto.Changeset{}} = Quests.update_quest(quest, @invalid_attrs)
      assert quest == Quests.get_quest!(quest.id)
    end

    test "delete_quest/1 deletes the quest" do
      quest = quest_fixture()
      assert {:ok, %Quest{}} = Quests.delete_quest(quest)
      assert_raise Ecto.NoResultsError, fn -> Quests.get_quest!(quest.id) end
    end

    test "change_quest/1 returns a quest changeset" do
      quest = quest_fixture()
      assert %Ecto.Changeset{} = Quests.change_quest(quest)
    end
  end
end
