defmodule GamificationWeb.QuestRewardLive.FormComponent do
  use GamificationWeb, :live_component

  alias Gamification.QuestsRewards

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage quest_reward records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="quest_reward-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:expire_at]} type="datetime-local" label="Expire at" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Quest reward</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{quest_reward: quest_reward} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(QuestsRewards.change_quest_reward(quest_reward))
     end)}
  end

  @impl true
  def handle_event("validate", %{"quest_reward" => quest_reward_params}, socket) do
    changeset = QuestsRewards.change_quest_reward(socket.assigns.quest_reward, quest_reward_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"quest_reward" => quest_reward_params}, socket) do
    save_quest_reward(socket, socket.assigns.action, quest_reward_params)
  end

  defp save_quest_reward(socket, :edit, quest_reward_params) do
    case QuestsRewards.update_quest_reward(socket.assigns.quest_reward, quest_reward_params) do
      {:ok, quest_reward} ->
        notify_parent({:saved, quest_reward})

        {:noreply,
         socket
         |> put_flash(:info, "Quest reward updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_quest_reward(socket, :new, quest_reward_params) do
    case QuestsRewards.create_quest_reward(quest_reward_params) do
      {:ok, quest_reward} ->
        notify_parent({:saved, quest_reward})

        {:noreply,
         socket
         |> put_flash(:info, "Quest reward created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
