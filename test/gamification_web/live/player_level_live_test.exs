defmodule GamificationWeb.PlayerLevelLiveTest do
  use GamificationWeb.ConnCase

  import Phoenix.LiveViewTest
  import Gamification.PlayersLevelsFixtures

  @create_attrs %{unlocked_at: "2025-02-22T21:54:00"}
  @update_attrs %{unlocked_at: "2025-02-23T21:54:00"}
  @invalid_attrs %{unlocked_at: nil}

  defp create_player_level(_) do
    player_level = player_level_fixture()
    %{player_level: player_level}
  end

  describe "Index" do
    setup [:create_player_level]

    test "lists all players_levels", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/players_levels")

      assert html =~ "Listing Players levels"
    end

    test "saves new player_level", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/players_levels")

      assert index_live |> element("a", "New Player level") |> render_click() =~
               "New Player level"

      assert_patch(index_live, ~p"/players_levels/new")

      assert index_live
             |> form("#player_level-form", player_level: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#player_level-form", player_level: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/players_levels")

      html = render(index_live)
      assert html =~ "Player level created successfully"
    end

    test "updates player_level in listing", %{conn: conn, player_level: player_level} do
      {:ok, index_live, _html} = live(conn, ~p"/players_levels")

      assert index_live |> element("#players_levels-#{player_level.id} a", "Edit") |> render_click() =~
               "Edit Player level"

      assert_patch(index_live, ~p"/players_levels/#{player_level}/edit")

      assert index_live
             |> form("#player_level-form", player_level: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#player_level-form", player_level: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/players_levels")

      html = render(index_live)
      assert html =~ "Player level updated successfully"
    end

    test "deletes player_level in listing", %{conn: conn, player_level: player_level} do
      {:ok, index_live, _html} = live(conn, ~p"/players_levels")

      assert index_live |> element("#players_levels-#{player_level.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#players_levels-#{player_level.id}")
    end
  end

  describe "Show" do
    setup [:create_player_level]

    test "displays player_level", %{conn: conn, player_level: player_level} do
      {:ok, _show_live, html} = live(conn, ~p"/players_levels/#{player_level}")

      assert html =~ "Show Player level"
    end

    test "updates player_level within modal", %{conn: conn, player_level: player_level} do
      {:ok, show_live, _html} = live(conn, ~p"/players_levels/#{player_level}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Player level"

      assert_patch(show_live, ~p"/players_levels/#{player_level}/show/edit")

      assert show_live
             |> form("#player_level-form", player_level: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#player_level-form", player_level: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/players_levels/#{player_level}")

      html = render(show_live)
      assert html =~ "Player level updated successfully"
    end
  end
end
