defmodule Gamification.PlayersAchievementsTest do
  use Gamification.DataCase

  alias Gamification.PlayersAchievements

  describe "players_achievements" do
    alias Gamification.PlayersAchievements.PlayerAchievement

    import Gamification.PlayersAchievementsFixtures

    @invalid_attrs %{achieved_at: nil}

    test "list_players_achievements/0 returns all players_achievements" do
      player_achievement = player_achievement_fixture()
      assert PlayersAchievements.list_players_achievements() == [player_achievement]
    end

    test "get_player_achievement!/1 returns the player_achievement with given id" do
      player_achievement = player_achievement_fixture()
      assert PlayersAchievements.get_player_achievement!(player_achievement.id) == player_achievement
    end

    test "create_player_achievement/1 with valid data creates a player_achievement" do
      valid_attrs = %{achieved_at: ~N[2025-02-22 22:44:00]}

      assert {:ok, %PlayerAchievement{} = player_achievement} = PlayersAchievements.create_player_achievement(valid_attrs)
      assert player_achievement.achieved_at == ~N[2025-02-22 22:44:00]
    end

    test "create_player_achievement/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PlayersAchievements.create_player_achievement(@invalid_attrs)
    end

    test "update_player_achievement/2 with valid data updates the player_achievement" do
      player_achievement = player_achievement_fixture()
      update_attrs = %{achieved_at: ~N[2025-02-23 22:44:00]}

      assert {:ok, %PlayerAchievement{} = player_achievement} = PlayersAchievements.update_player_achievement(player_achievement, update_attrs)
      assert player_achievement.achieved_at == ~N[2025-02-23 22:44:00]
    end

    test "update_player_achievement/2 with invalid data returns error changeset" do
      player_achievement = player_achievement_fixture()
      assert {:error, %Ecto.Changeset{}} = PlayersAchievements.update_player_achievement(player_achievement, @invalid_attrs)
      assert player_achievement == PlayersAchievements.get_player_achievement!(player_achievement.id)
    end

    test "delete_player_achievement/1 deletes the player_achievement" do
      player_achievement = player_achievement_fixture()
      assert {:ok, %PlayerAchievement{}} = PlayersAchievements.delete_player_achievement(player_achievement)
      assert_raise Ecto.NoResultsError, fn -> PlayersAchievements.get_player_achievement!(player_achievement.id) end
    end

    test "change_player_achievement/1 returns a player_achievement changeset" do
      player_achievement = player_achievement_fixture()
      assert %Ecto.Changeset{} = PlayersAchievements.change_player_achievement(player_achievement)
    end
  end
end
