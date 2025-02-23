defmodule GamificationWeb.MilestoneLiveTest do
  use GamificationWeb.ConnCase

  import Phoenix.LiveViewTest
  import Gamification.MilestonesFixtures

  @create_attrs %{name: "some name", description: "some description", points_rewarded: 42}
  @update_attrs %{name: "some updated name", description: "some updated description", points_rewarded: 43}
  @invalid_attrs %{name: nil, description: nil, points_rewarded: nil}

  defp create_milestone(_) do
    milestone = milestone_fixture()
    %{milestone: milestone}
  end

  describe "Index" do
    setup [:create_milestone]

    test "lists all milestones", %{conn: conn, milestone: milestone} do
      {:ok, _index_live, html} = live(conn, ~p"/milestones")

      assert html =~ "Listing Milestones"
      assert html =~ milestone.name
    end

    test "saves new milestone", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/milestones")

      assert index_live |> element("a", "New Milestone") |> render_click() =~
               "New Milestone"

      assert_patch(index_live, ~p"/milestones/new")

      assert index_live
             |> form("#milestone-form", milestone: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#milestone-form", milestone: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/milestones")

      html = render(index_live)
      assert html =~ "Milestone created successfully"
      assert html =~ "some name"
    end

    test "updates milestone in listing", %{conn: conn, milestone: milestone} do
      {:ok, index_live, _html} = live(conn, ~p"/milestones")

      assert index_live |> element("#milestones-#{milestone.id} a", "Edit") |> render_click() =~
               "Edit Milestone"

      assert_patch(index_live, ~p"/milestones/#{milestone}/edit")

      assert index_live
             |> form("#milestone-form", milestone: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#milestone-form", milestone: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/milestones")

      html = render(index_live)
      assert html =~ "Milestone updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes milestone in listing", %{conn: conn, milestone: milestone} do
      {:ok, index_live, _html} = live(conn, ~p"/milestones")

      assert index_live |> element("#milestones-#{milestone.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#milestones-#{milestone.id}")
    end
  end

  describe "Show" do
    setup [:create_milestone]

    test "displays milestone", %{conn: conn, milestone: milestone} do
      {:ok, _show_live, html} = live(conn, ~p"/milestones/#{milestone}")

      assert html =~ "Show Milestone"
      assert html =~ milestone.name
    end

    test "updates milestone within modal", %{conn: conn, milestone: milestone} do
      {:ok, show_live, _html} = live(conn, ~p"/milestones/#{milestone}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Milestone"

      assert_patch(show_live, ~p"/milestones/#{milestone}/show/edit")

      assert show_live
             |> form("#milestone-form", milestone: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#milestone-form", milestone: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/milestones/#{milestone}")

      html = render(show_live)
      assert html =~ "Milestone updated successfully"
      assert html =~ "some updated name"
    end
  end
end
