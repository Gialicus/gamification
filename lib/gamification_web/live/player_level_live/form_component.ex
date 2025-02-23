defmodule GamificationWeb.PlayerLevelLive.FormComponent do
  use GamificationWeb, :live_component

  alias Gamification.PlayersLevels

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage player_level records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="player_level-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:unlocked_at]} type="datetime-local" label="Unlocked at" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Player level</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{player_level: player_level} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(PlayersLevels.change_player_level(player_level))
     end)}
  end

  @impl true
  def handle_event("validate", %{"player_level" => player_level_params}, socket) do
    changeset = PlayersLevels.change_player_level(socket.assigns.player_level, player_level_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"player_level" => player_level_params}, socket) do
    save_player_level(socket, socket.assigns.action, player_level_params)
  end

  defp save_player_level(socket, :edit, player_level_params) do
    case PlayersLevels.update_player_level(socket.assigns.player_level, player_level_params) do
      {:ok, player_level} ->
        notify_parent({:saved, player_level})

        {:noreply,
         socket
         |> put_flash(:info, "Player level updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_player_level(socket, :new, player_level_params) do
    case PlayersLevels.create_player_level(player_level_params) do
      {:ok, player_level} ->
        notify_parent({:saved, player_level})

        {:noreply,
         socket
         |> put_flash(:info, "Player level created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
