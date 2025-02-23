defmodule GamificationWeb.ActiveQuestLive.Show do
  use GamificationWeb, :live_view

  alias Gamification.ActiveQuests

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:active_quest, ActiveQuests.get_active_quest!(id))}
  end

  defp page_title(:show), do: "Show Active quest"
  defp page_title(:edit), do: "Edit Active quest"
end
