defmodule Gamification.PlayerAchievementsTest do
  use Gamification.DataCase

  alias Gamification.PlayerAchievements

  describe "player_achievements" do
    alias Gamification.PlayerAchievements.PlayerAchievement

    import Gamification.PlayerAchievementsFixtures

    @invalid_attrs %{achieved_at: nil}

    test "list_player_achievements/0 returns all player_achievements" do
      player_achievement = player_achievement_fixture()
      assert PlayerAchievements.list_player_achievements() == [player_achievement]
    end

    test "get_player_achievement!/1 returns the player_achievement with given id" do
      player_achievement = player_achievement_fixture()
      assert PlayerAchievements.get_player_achievement!(player_achievement.id) == player_achievement
    end

    test "create_player_achievement/1 with valid data creates a player_achievement" do
      valid_attrs = %{achieved_at: ~N[2025-02-22 22:04:00]}

      assert {:ok, %PlayerAchievement{} = player_achievement} = PlayerAchievements.create_player_achievement(valid_attrs)
      assert player_achievement.achieved_at == ~N[2025-02-22 22:04:00]
    end

    test "create_player_achievement/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PlayerAchievements.create_player_achievement(@invalid_attrs)
    end

    test "update_player_achievement/2 with valid data updates the player_achievement" do
      player_achievement = player_achievement_fixture()
      update_attrs = %{achieved_at: ~N[2025-02-23 22:04:00]}

      assert {:ok, %PlayerAchievement{} = player_achievement} = PlayerAchievements.update_player_achievement(player_achievement, update_attrs)
      assert player_achievement.achieved_at == ~N[2025-02-23 22:04:00]
    end

    test "update_player_achievement/2 with invalid data returns error changeset" do
      player_achievement = player_achievement_fixture()
      assert {:error, %Ecto.Changeset{}} = PlayerAchievements.update_player_achievement(player_achievement, @invalid_attrs)
      assert player_achievement == PlayerAchievements.get_player_achievement!(player_achievement.id)
    end

    test "delete_player_achievement/1 deletes the player_achievement" do
      player_achievement = player_achievement_fixture()
      assert {:ok, %PlayerAchievement{}} = PlayerAchievements.delete_player_achievement(player_achievement)
      assert_raise Ecto.NoResultsError, fn -> PlayerAchievements.get_player_achievement!(player_achievement.id) end
    end

    test "change_player_achievement/1 returns a player_achievement changeset" do
      player_achievement = player_achievement_fixture()
      assert %Ecto.Changeset{} = PlayerAchievements.change_player_achievement(player_achievement)
    end
  end
end
