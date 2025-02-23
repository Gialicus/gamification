defmodule GamificationWeb.ActiveQuestLive.Index do
  use GamificationWeb, :live_view

  alias Gamification.ActiveQuests
  alias Gamification.ActiveQuests.ActiveQuest

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :active_quests, ActiveQuests.list_active_quests())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Active quest")
    |> assign(:active_quest, ActiveQuests.get_active_quest!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Active quest")
    |> assign(:active_quest, %ActiveQuest{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Active quests")
    |> assign(:active_quest, nil)
  end

  @impl true
  def handle_info({GamificationWeb.ActiveQuestLive.FormComponent, {:saved, active_quest}}, socket) do
    {:noreply, stream_insert(socket, :active_quests, active_quest)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    active_quest = ActiveQuests.get_active_quest!(id)
    {:ok, _} = ActiveQuests.delete_active_quest(active_quest)

    {:noreply, stream_delete(socket, :active_quests, active_quest)}
  end
end
