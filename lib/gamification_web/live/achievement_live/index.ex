defmodule GamificationWeb.AchievementLive.Index do
  use GamificationWeb, :live_view

  alias Gamification.Achievements
  alias Gamification.Achievements.Achievement

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :achievements, Achievements.list_achievements())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Achievement")
    |> assign(:achievement, Achievements.get_achievement!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Achievement")
    |> assign(:achievement, %Achievement{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Achievements")
    |> assign(:achievement, nil)
  end

  @impl true
  def handle_info({GamificationWeb.AchievementLive.FormComponent, {:saved, achievement}}, socket) do
    {:noreply, stream_insert(socket, :achievements, achievement)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    achievement = Achievements.get_achievement!(id)
    {:ok, _} = Achievements.delete_achievement(achievement)

    {:noreply, stream_delete(socket, :achievements, achievement)}
  end
end
