defmodule GamificationWeb.MilestoneLive.Index do
  use GamificationWeb, :live_view

  alias Gamification.Milestones
  alias Gamification.Milestones.Milestone

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :milestones, Milestones.list_milestones())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Milestone")
    |> assign(:milestone, Milestones.get_milestone!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Milestone")
    |> assign(:milestone, %Milestone{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Milestones")
    |> assign(:milestone, nil)
  end

  @impl true
  def handle_info({GamificationWeb.MilestoneLive.FormComponent, {:saved, milestone}}, socket) do
    {:noreply, stream_insert(socket, :milestones, milestone)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    milestone = Milestones.get_milestone!(id)
    {:ok, _} = Milestones.delete_milestone(milestone)

    {:noreply, stream_delete(socket, :milestones, milestone)}
  end
end
