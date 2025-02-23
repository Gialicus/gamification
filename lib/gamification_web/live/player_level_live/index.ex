defmodule GamificationWeb.PlayerLevelLive.Index do
  use GamificationWeb, :live_view

  alias Gamification.PlayersLevels
  alias Gamification.PlayersLevels.PlayerLevel

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :players_levels, PlayersLevels.list_players_levels())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Player level")
    |> assign(:player_level, PlayersLevels.get_player_level!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Player level")
    |> assign(:player_level, %PlayerLevel{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Players levels")
    |> assign(:player_level, nil)
  end

  @impl true
  def handle_info({GamificationWeb.PlayerLevelLive.FormComponent, {:saved, player_level}}, socket) do
    {:noreply, stream_insert(socket, :players_levels, player_level)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    player_level = PlayersLevels.get_player_level!(id)
    {:ok, _} = PlayersLevels.delete_player_level(player_level)

    {:noreply, stream_delete(socket, :players_levels, player_level)}
  end
end
