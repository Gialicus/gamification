defmodule GamificationWeb.MilestoneLive.Show do
  use GamificationWeb, :live_view

  alias Gamification.Milestones

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:milestone, Milestones.get_milestone!(id))}
  end

  defp page_title(:show), do: "Show Milestone"
  defp page_title(:edit), do: "Edit Milestone"
end
