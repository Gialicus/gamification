defmodule Gamification.PlayersLevelsTest do
  use Gamification.DataCase

  alias Gamification.PlayersLevels

  describe "players_levels" do
    alias Gamification.PlayersLevels.PlayerLevel

    import Gamification.PlayersLevelsFixtures

    @invalid_attrs %{unlocked_at: nil}

    test "list_players_levels/0 returns all players_levels" do
      player_level = player_level_fixture()
      assert PlayersLevels.list_players_levels() == [player_level]
    end

    test "get_player_level!/1 returns the player_level with given id" do
      player_level = player_level_fixture()
      assert PlayersLevels.get_player_level!(player_level.id) == player_level
    end

    test "create_player_level/1 with valid data creates a player_level" do
      valid_attrs = %{unlocked_at: ~N[2025-02-22 21:54:00]}

      assert {:ok, %PlayerLevel{} = player_level} = PlayersLevels.create_player_level(valid_attrs)
      assert player_level.unlocked_at == ~N[2025-02-22 21:54:00]
    end

    test "create_player_level/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PlayersLevels.create_player_level(@invalid_attrs)
    end

    test "update_player_level/2 with valid data updates the player_level" do
      player_level = player_level_fixture()
      update_attrs = %{unlocked_at: ~N[2025-02-23 21:54:00]}

      assert {:ok, %PlayerLevel{} = player_level} = PlayersLevels.update_player_level(player_level, update_attrs)
      assert player_level.unlocked_at == ~N[2025-02-23 21:54:00]
    end

    test "update_player_level/2 with invalid data returns error changeset" do
      player_level = player_level_fixture()
      assert {:error, %Ecto.Changeset{}} = PlayersLevels.update_player_level(player_level, @invalid_attrs)
      assert player_level == PlayersLevels.get_player_level!(player_level.id)
    end

    test "delete_player_level/1 deletes the player_level" do
      player_level = player_level_fixture()
      assert {:ok, %PlayerLevel{}} = PlayersLevels.delete_player_level(player_level)
      assert_raise Ecto.NoResultsError, fn -> PlayersLevels.get_player_level!(player_level.id) end
    end

    test "change_player_level/1 returns a player_level changeset" do
      player_level = player_level_fixture()
      assert %Ecto.Changeset{} = PlayersLevels.change_player_level(player_level)
    end
  end
end
