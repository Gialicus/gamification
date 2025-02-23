defmodule GamificationWeb.PlayerAchievementLiveTest do
  use GamificationWeb.ConnCase

  import Phoenix.LiveViewTest
  import Gamification.PlayersAchievementsFixtures

  @create_attrs %{achieved_at: "2025-02-22T22:44:00"}
  @update_attrs %{achieved_at: "2025-02-23T22:44:00"}
  @invalid_attrs %{achieved_at: nil}

  defp create_player_achievement(_) do
    player_achievement = player_achievement_fixture()
    %{player_achievement: player_achievement}
  end

  describe "Index" do
    setup [:create_player_achievement]

    test "lists all players_achievements", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/players_achievements")

      assert html =~ "Listing Players achievements"
    end

    test "saves new player_achievement", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/players_achievements")

      assert index_live |> element("a", "New Player achievement") |> render_click() =~
               "New Player achievement"

      assert_patch(index_live, ~p"/players_achievements/new")

      assert index_live
             |> form("#player_achievement-form", player_achievement: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#player_achievement-form", player_achievement: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/players_achievements")

      html = render(index_live)
      assert html =~ "Player achievement created successfully"
    end

    test "updates player_achievement in listing", %{conn: conn, player_achievement: player_achievement} do
      {:ok, index_live, _html} = live(conn, ~p"/players_achievements")

      assert index_live |> element("#players_achievements-#{player_achievement.id} a", "Edit") |> render_click() =~
               "Edit Player achievement"

      assert_patch(index_live, ~p"/players_achievements/#{player_achievement}/edit")

      assert index_live
             |> form("#player_achievement-form", player_achievement: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#player_achievement-form", player_achievement: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/players_achievements")

      html = render(index_live)
      assert html =~ "Player achievement updated successfully"
    end

    test "deletes player_achievement in listing", %{conn: conn, player_achievement: player_achievement} do
      {:ok, index_live, _html} = live(conn, ~p"/players_achievements")

      assert index_live |> element("#players_achievements-#{player_achievement.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#players_achievements-#{player_achievement.id}")
    end
  end

  describe "Show" do
    setup [:create_player_achievement]

    test "displays player_achievement", %{conn: conn, player_achievement: player_achievement} do
      {:ok, _show_live, html} = live(conn, ~p"/players_achievements/#{player_achievement}")

      assert html =~ "Show Player achievement"
    end

    test "updates player_achievement within modal", %{conn: conn, player_achievement: player_achievement} do
      {:ok, show_live, _html} = live(conn, ~p"/players_achievements/#{player_achievement}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Player achievement"

      assert_patch(show_live, ~p"/players_achievements/#{player_achievement}/show/edit")

      assert show_live
             |> form("#player_achievement-form", player_achievement: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#player_achievement-form", player_achievement: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/players_achievements/#{player_achievement}")

      html = render(show_live)
      assert html =~ "Player achievement updated successfully"
    end
  end
end
