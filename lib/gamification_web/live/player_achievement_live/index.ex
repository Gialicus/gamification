defmodule GamificationWeb.PlayerAchievementLive.Index do
  use GamificationWeb, :live_view

  alias Gamification.PlayerAchievements
  alias Gamification.PlayerAchievements.PlayerAchievement

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :player_achievements, PlayerAchievements.list_player_achievements())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Player achievement")
    |> assign(:player_achievement, PlayerAchievements.get_player_achievement!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Player achievement")
    |> assign(:player_achievement, %PlayerAchievement{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Player achievements")
    |> assign(:player_achievement, nil)
  end

  @impl true
  def handle_info({GamificationWeb.PlayerAchievementLive.FormComponent, {:saved, player_achievement}}, socket) do
    {:noreply, stream_insert(socket, :player_achievements, player_achievement)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    player_achievement = PlayerAchievements.get_player_achievement!(id)
    {:ok, _} = PlayerAchievements.delete_player_achievement(player_achievement)

    {:noreply, stream_delete(socket, :player_achievements, player_achievement)}
  end
end
