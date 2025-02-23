defmodule Gamification.AchievementsTest do
  use Gamification.DataCase

  alias Gamification.Achievements

  describe "achievements" do
    alias Gamification.Achievements.Achievement

    import Gamification.AchievementsFixtures

    @invalid_attrs %{name: nil, description: nil, points_awarded: nil}

    test "list_achievements/0 returns all achievements" do
      achievement = achievement_fixture()
      assert Achievements.list_achievements() == [achievement]
    end

    test "get_achievement!/1 returns the achievement with given id" do
      achievement = achievement_fixture()
      assert Achievements.get_achievement!(achievement.id) == achievement
    end

    test "create_achievement/1 with valid data creates a achievement" do
      valid_attrs = %{name: "some name", description: "some description", points_awarded: 42}

      assert {:ok, %Achievement{} = achievement} = Achievements.create_achievement(valid_attrs)
      assert achievement.name == "some name"
      assert achievement.description == "some description"
      assert achievement.points_awarded == 42
    end

    test "create_achievement/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Achievements.create_achievement(@invalid_attrs)
    end

    test "update_achievement/2 with valid data updates the achievement" do
      achievement = achievement_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", points_awarded: 43}

      assert {:ok, %Achievement{} = achievement} = Achievements.update_achievement(achievement, update_attrs)
      assert achievement.name == "some updated name"
      assert achievement.description == "some updated description"
      assert achievement.points_awarded == 43
    end

    test "update_achievement/2 with invalid data returns error changeset" do
      achievement = achievement_fixture()
      assert {:error, %Ecto.Changeset{}} = Achievements.update_achievement(achievement, @invalid_attrs)
      assert achievement == Achievements.get_achievement!(achievement.id)
    end

    test "delete_achievement/1 deletes the achievement" do
      achievement = achievement_fixture()
      assert {:ok, %Achievement{}} = Achievements.delete_achievement(achievement)
      assert_raise Ecto.NoResultsError, fn -> Achievements.get_achievement!(achievement.id) end
    end

    test "change_achievement/1 returns a achievement changeset" do
      achievement = achievement_fixture()
      assert %Ecto.Changeset{} = Achievements.change_achievement(achievement)
    end
  end
end
