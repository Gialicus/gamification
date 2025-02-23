defmodule GamificationWeb.ActiveQuestLive.FormComponent do
  use GamificationWeb, :live_component

  alias Gamification.ActiveQuests

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage active_quest records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="active_quest-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:started_at]} type="datetime-local" label="Started at" />
        <.input field={@form[:completed_at]} type="datetime-local" label="Completed at" />
        <.input field={@form[:status]} type="text" label="Status" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Active quest</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{active_quest: active_quest} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(ActiveQuests.change_active_quest(active_quest))
     end)}
  end

  @impl true
  def handle_event("validate", %{"active_quest" => active_quest_params}, socket) do
    changeset = ActiveQuests.change_active_quest(socket.assigns.active_quest, active_quest_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"active_quest" => active_quest_params}, socket) do
    save_active_quest(socket, socket.assigns.action, active_quest_params)
  end

  defp save_active_quest(socket, :edit, active_quest_params) do
    case ActiveQuests.update_active_quest(socket.assigns.active_quest, active_quest_params) do
      {:ok, active_quest} ->
        notify_parent({:saved, active_quest})

        {:noreply,
         socket
         |> put_flash(:info, "Active quest updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_active_quest(socket, :new, active_quest_params) do
    case ActiveQuests.create_active_quest(active_quest_params) do
      {:ok, active_quest} ->
        notify_parent({:saved, active_quest})

        {:noreply,
         socket
         |> put_flash(:info, "Active quest created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
