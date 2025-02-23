defmodule GamificationWeb.ActiveQuestLiveTest do
  use GamificationWeb.ConnCase

  import Phoenix.LiveViewTest
  import Gamification.ActiveQuestsFixtures

  @create_attrs %{status: "some status", started_at: "2025-02-22T21:59:00", completed_at: "2025-02-22T21:59:00"}
  @update_attrs %{status: "some updated status", started_at: "2025-02-23T21:59:00", completed_at: "2025-02-23T21:59:00"}
  @invalid_attrs %{status: nil, started_at: nil, completed_at: nil}

  defp create_active_quest(_) do
    active_quest = active_quest_fixture()
    %{active_quest: active_quest}
  end

  describe "Index" do
    setup [:create_active_quest]

    test "lists all active_quests", %{conn: conn, active_quest: active_quest} do
      {:ok, _index_live, html} = live(conn, ~p"/active_quests")

      assert html =~ "Listing Active quests"
      assert html =~ active_quest.status
    end

    test "saves new active_quest", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/active_quests")

      assert index_live |> element("a", "New Active quest") |> render_click() =~
               "New Active quest"

      assert_patch(index_live, ~p"/active_quests/new")

      assert index_live
             |> form("#active_quest-form", active_quest: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#active_quest-form", active_quest: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/active_quests")

      html = render(index_live)
      assert html =~ "Active quest created successfully"
      assert html =~ "some status"
    end

    test "updates active_quest in listing", %{conn: conn, active_quest: active_quest} do
      {:ok, index_live, _html} = live(conn, ~p"/active_quests")

      assert index_live |> element("#active_quests-#{active_quest.id} a", "Edit") |> render_click() =~
               "Edit Active quest"

      assert_patch(index_live, ~p"/active_quests/#{active_quest}/edit")

      assert index_live
             |> form("#active_quest-form", active_quest: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#active_quest-form", active_quest: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/active_quests")

      html = render(index_live)
      assert html =~ "Active quest updated successfully"
      assert html =~ "some updated status"
    end

    test "deletes active_quest in listing", %{conn: conn, active_quest: active_quest} do
      {:ok, index_live, _html} = live(conn, ~p"/active_quests")

      assert index_live |> element("#active_quests-#{active_quest.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#active_quests-#{active_quest.id}")
    end
  end

  describe "Show" do
    setup [:create_active_quest]

    test "displays active_quest", %{conn: conn, active_quest: active_quest} do
      {:ok, _show_live, html} = live(conn, ~p"/active_quests/#{active_quest}")

      assert html =~ "Show Active quest"
      assert html =~ active_quest.status
    end

    test "updates active_quest within modal", %{conn: conn, active_quest: active_quest} do
      {:ok, show_live, _html} = live(conn, ~p"/active_quests/#{active_quest}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Active quest"

      assert_patch(show_live, ~p"/active_quests/#{active_quest}/show/edit")

      assert show_live
             |> form("#active_quest-form", active_quest: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#active_quest-form", active_quest: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/active_quests/#{active_quest}")

      html = render(show_live)
      assert html =~ "Active quest updated successfully"
      assert html =~ "some updated status"
    end
  end
end
