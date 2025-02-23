defmodule GamificationWeb.QuestRewardLiveTest do
  use GamificationWeb.ConnCase

  import Phoenix.LiveViewTest
  import Gamification.QuestRewardsFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_quest_reward(_) do
    quest_reward = quest_reward_fixture()
    %{quest_reward: quest_reward}
  end

  describe "Index" do
    setup [:create_quest_reward]

    test "lists all quest_rewards", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/quest_rewards")

      assert html =~ "Listing Quest rewards"
    end

    test "saves new quest_reward", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/quest_rewards")

      assert index_live |> element("a", "New Quest reward") |> render_click() =~
               "New Quest reward"

      assert_patch(index_live, ~p"/quest_rewards/new")

      assert index_live
             |> form("#quest_reward-form", quest_reward: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#quest_reward-form", quest_reward: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/quest_rewards")

      html = render(index_live)
      assert html =~ "Quest reward created successfully"
    end

    test "updates quest_reward in listing", %{conn: conn, quest_reward: quest_reward} do
      {:ok, index_live, _html} = live(conn, ~p"/quest_rewards")

      assert index_live |> element("#quest_rewards-#{quest_reward.id} a", "Edit") |> render_click() =~
               "Edit Quest reward"

      assert_patch(index_live, ~p"/quest_rewards/#{quest_reward}/edit")

      assert index_live
             |> form("#quest_reward-form", quest_reward: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#quest_reward-form", quest_reward: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/quest_rewards")

      html = render(index_live)
      assert html =~ "Quest reward updated successfully"
    end

    test "deletes quest_reward in listing", %{conn: conn, quest_reward: quest_reward} do
      {:ok, index_live, _html} = live(conn, ~p"/quest_rewards")

      assert index_live |> element("#quest_rewards-#{quest_reward.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#quest_rewards-#{quest_reward.id}")
    end
  end

  describe "Show" do
    setup [:create_quest_reward]

    test "displays quest_reward", %{conn: conn, quest_reward: quest_reward} do
      {:ok, _show_live, html} = live(conn, ~p"/quest_rewards/#{quest_reward}")

      assert html =~ "Show Quest reward"
    end

    test "updates quest_reward within modal", %{conn: conn, quest_reward: quest_reward} do
      {:ok, show_live, _html} = live(conn, ~p"/quest_rewards/#{quest_reward}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Quest reward"

      assert_patch(show_live, ~p"/quest_rewards/#{quest_reward}/show/edit")

      assert show_live
             |> form("#quest_reward-form", quest_reward: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#quest_reward-form", quest_reward: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/quest_rewards/#{quest_reward}")

      html = render(show_live)
      assert html =~ "Quest reward updated successfully"
    end
  end
end
