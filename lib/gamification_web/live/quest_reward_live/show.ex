defmodule GamificationWeb.QuestRewardLive.Show do
  use GamificationWeb, :live_view

  alias Gamification.QuestsRewards

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:quest_reward, QuestsRewards.get_quest_reward!(id))}
  end

  defp page_title(:show), do: "Show Quest reward"
  defp page_title(:edit), do: "Edit Quest reward"
end
