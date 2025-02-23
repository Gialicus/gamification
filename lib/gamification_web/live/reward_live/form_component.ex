defmodule GamificationWeb.RewardLive.FormComponent do
  use GamificationWeb, :live_component

  alias Gamification.Rewards

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage reward records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="reward-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:description]} type="text" label="Description" />
        <.input field={@form[:points_cost]} type="number" label="Points cost" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Reward</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{reward: reward} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Rewards.change_reward(reward))
     end)}
  end

  @impl true
  def handle_event("validate", %{"reward" => reward_params}, socket) do
    changeset = Rewards.change_reward(socket.assigns.reward, reward_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"reward" => reward_params}, socket) do
    save_reward(socket, socket.assigns.action, reward_params)
  end

  defp save_reward(socket, :edit, reward_params) do
    case Rewards.update_reward(socket.assigns.reward, reward_params) do
      {:ok, reward} ->
        notify_parent({:saved, reward})

        {:noreply,
         socket
         |> put_flash(:info, "Reward updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_reward(socket, :new, reward_params) do
    case Rewards.create_reward(reward_params) do
      {:ok, reward} ->
        notify_parent({:saved, reward})

        {:noreply,
         socket
         |> put_flash(:info, "Reward created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
