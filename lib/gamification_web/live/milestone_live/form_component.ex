defmodule GamificationWeb.MilestoneLive.FormComponent do
  use GamificationWeb, :live_component

  alias Gamification.Milestones

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage milestone records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="milestone-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:description]} type="text" label="Description" />
        <.input field={@form[:points_rewarded]} type="number" label="Points rewarded" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Milestone</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{milestone: milestone} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Milestones.change_milestone(milestone))
     end)}
  end

  @impl true
  def handle_event("validate", %{"milestone" => milestone_params}, socket) do
    changeset = Milestones.change_milestone(socket.assigns.milestone, milestone_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"milestone" => milestone_params}, socket) do
    save_milestone(socket, socket.assigns.action, milestone_params)
  end

  defp save_milestone(socket, :edit, milestone_params) do
    case Milestones.update_milestone(socket.assigns.milestone, milestone_params) do
      {:ok, milestone} ->
        notify_parent({:saved, milestone})

        {:noreply,
         socket
         |> put_flash(:info, "Milestone updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_milestone(socket, :new, milestone_params) do
    case Milestones.create_milestone(milestone_params) do
      {:ok, milestone} ->
        notify_parent({:saved, milestone})

        {:noreply,
         socket
         |> put_flash(:info, "Milestone created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
