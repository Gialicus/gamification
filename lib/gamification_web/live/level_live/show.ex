defmodule GamificationWeb.LevelLive.Show do
  use GamificationWeb, :live_view

  alias Gamification.Levels

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:level, Levels.get_level!(id))}
  end

  defp page_title(:show), do: "Show Level"
  defp page_title(:edit), do: "Edit Level"
end
