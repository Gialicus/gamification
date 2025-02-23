defmodule GamificationWeb.PlayerAchievementLive.Show do
  use GamificationWeb, :live_view

  alias Gamification.PlayersAchievements

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:player_achievement, PlayersAchievements.get_player_achievement!(id))}
  end

  defp page_title(:show), do: "Show Player achievement"
  defp page_title(:edit), do: "Edit Player achievement"
end
