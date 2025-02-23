defmodule Gamification.MilestonesTest do
  use Gamification.DataCase

  alias Gamification.Milestones

  describe "milestones" do
    alias Gamification.Milestones.Milestone

    import Gamification.MilestonesFixtures

    @invalid_attrs %{name: nil, description: nil, points_rewarded: nil}

    test "list_milestones/0 returns all milestones" do
      milestone = milestone_fixture()
      assert Milestones.list_milestones() == [milestone]
    end

    test "get_milestone!/1 returns the milestone with given id" do
      milestone = milestone_fixture()
      assert Milestones.get_milestone!(milestone.id) == milestone
    end

    test "create_milestone/1 with valid data creates a milestone" do
      valid_attrs = %{name: "some name", description: "some description", points_rewarded: 42}

      assert {:ok, %Milestone{} = milestone} = Milestones.create_milestone(valid_attrs)
      assert milestone.name == "some name"
      assert milestone.description == "some description"
      assert milestone.points_rewarded == 42
    end

    test "create_milestone/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Milestones.create_milestone(@invalid_attrs)
    end

    test "update_milestone/2 with valid data updates the milestone" do
      milestone = milestone_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", points_rewarded: 43}

      assert {:ok, %Milestone{} = milestone} = Milestones.update_milestone(milestone, update_attrs)
      assert milestone.name == "some updated name"
      assert milestone.description == "some updated description"
      assert milestone.points_rewarded == 43
    end

    test "update_milestone/2 with invalid data returns error changeset" do
      milestone = milestone_fixture()
      assert {:error, %Ecto.Changeset{}} = Milestones.update_milestone(milestone, @invalid_attrs)
      assert milestone == Milestones.get_milestone!(milestone.id)
    end

    test "delete_milestone/1 deletes the milestone" do
      milestone = milestone_fixture()
      assert {:ok, %Milestone{}} = Milestones.delete_milestone(milestone)
      assert_raise Ecto.NoResultsError, fn -> Milestones.get_milestone!(milestone.id) end
    end

    test "change_milestone/1 returns a milestone changeset" do
      milestone = milestone_fixture()
      assert %Ecto.Changeset{} = Milestones.change_milestone(milestone)
    end
  end
end
