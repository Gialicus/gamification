defmodule GamificationWeb.PlayerAchievementLive.FormComponent do
  use GamificationWeb, :live_component

  alias Gamification.PlayersAchievements

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage player_achievement records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="player_achievement-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:achieved_at]} type="datetime-local" label="Achieved at" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Player achievement</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{player_achievement: player_achievement} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(PlayersAchievements.change_player_achievement(player_achievement))
     end)}
  end

  @impl true
  def handle_event("validate", %{"player_achievement" => player_achievement_params}, socket) do
    changeset = PlayersAchievements.change_player_achievement(socket.assigns.player_achievement, player_achievement_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"player_achievement" => player_achievement_params}, socket) do
    save_player_achievement(socket, socket.assigns.action, player_achievement_params)
  end

  defp save_player_achievement(socket, :edit, player_achievement_params) do
    case PlayersAchievements.update_player_achievement(socket.assigns.player_achievement, player_achievement_params) do
      {:ok, player_achievement} ->
        notify_parent({:saved, player_achievement})

        {:noreply,
         socket
         |> put_flash(:info, "Player achievement updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_player_achievement(socket, :new, player_achievement_params) do
    case PlayersAchievements.create_player_achievement(player_achievement_params) do
      {:ok, player_achievement} ->
        notify_parent({:saved, player_achievement})

        {:noreply,
         socket
         |> put_flash(:info, "Player achievement created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
