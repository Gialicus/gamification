defmodule Gamification.ActiveQuestsTest do
  use Gamification.DataCase

  alias Gamification.ActiveQuests

  describe "active_quests" do
    alias Gamification.ActiveQuests.ActiveQuest

    import Gamification.ActiveQuestsFixtures

    @invalid_attrs %{status: nil, started_at: nil, completed_at: nil}

    test "list_active_quests/0 returns all active_quests" do
      active_quest = active_quest_fixture()
      assert ActiveQuests.list_active_quests() == [active_quest]
    end

    test "get_active_quest!/1 returns the active_quest with given id" do
      active_quest = active_quest_fixture()
      assert ActiveQuests.get_active_quest!(active_quest.id) == active_quest
    end

    test "create_active_quest/1 with valid data creates a active_quest" do
      valid_attrs = %{status: "some status", started_at: ~N[2025-02-22 21:59:00], completed_at: ~N[2025-02-22 21:59:00]}

      assert {:ok, %ActiveQuest{} = active_quest} = ActiveQuests.create_active_quest(valid_attrs)
      assert active_quest.status == "some status"
      assert active_quest.started_at == ~N[2025-02-22 21:59:00]
      assert active_quest.completed_at == ~N[2025-02-22 21:59:00]
    end

    test "create_active_quest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ActiveQuests.create_active_quest(@invalid_attrs)
    end

    test "update_active_quest/2 with valid data updates the active_quest" do
      active_quest = active_quest_fixture()
      update_attrs = %{status: "some updated status", started_at: ~N[2025-02-23 21:59:00], completed_at: ~N[2025-02-23 21:59:00]}

      assert {:ok, %ActiveQuest{} = active_quest} = ActiveQuests.update_active_quest(active_quest, update_attrs)
      assert active_quest.status == "some updated status"
      assert active_quest.started_at == ~N[2025-02-23 21:59:00]
      assert active_quest.completed_at == ~N[2025-02-23 21:59:00]
    end

    test "update_active_quest/2 with invalid data returns error changeset" do
      active_quest = active_quest_fixture()
      assert {:error, %Ecto.Changeset{}} = ActiveQuests.update_active_quest(active_quest, @invalid_attrs)
      assert active_quest == ActiveQuests.get_active_quest!(active_quest.id)
    end

    test "delete_active_quest/1 deletes the active_quest" do
      active_quest = active_quest_fixture()
      assert {:ok, %ActiveQuest{}} = ActiveQuests.delete_active_quest(active_quest)
      assert_raise Ecto.NoResultsError, fn -> ActiveQuests.get_active_quest!(active_quest.id) end
    end

    test "change_active_quest/1 returns a active_quest changeset" do
      active_quest = active_quest_fixture()
      assert %Ecto.Changeset{} = ActiveQuests.change_active_quest(active_quest)
    end
  end
end
