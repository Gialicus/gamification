defmodule GamificationWeb.QuestRewardLive.Index do
  use GamificationWeb, :live_view

  alias Gamification.QuestsRewards
  alias Gamification.QuestsRewards.QuestReward

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :quests_rewards, QuestsRewards.list_quests_rewards())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Quest reward")
    |> assign(:quest_reward, QuestsRewards.get_quest_reward!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Quest reward")
    |> assign(:quest_reward, %QuestReward{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Quests rewards")
    |> assign(:quest_reward, nil)
  end

  @impl true
  def handle_info({GamificationWeb.QuestRewardLive.FormComponent, {:saved, quest_reward}}, socket) do
    {:noreply, stream_insert(socket, :quests_rewards, quest_reward)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    quest_reward = QuestsRewards.get_quest_reward!(id)
    {:ok, _} = QuestsRewards.delete_quest_reward(quest_reward)

    {:noreply, stream_delete(socket, :quests_rewards, quest_reward)}
  end
end
