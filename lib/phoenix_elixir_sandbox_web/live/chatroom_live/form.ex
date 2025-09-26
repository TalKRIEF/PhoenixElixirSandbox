defmodule PhoenixElixirSandboxWeb.ChatroomLive.Form do
  use PhoenixElixirSandboxWeb, :live_view

  alias PhoenixElixirSandbox.Chatrooms
  alias PhoenixElixirSandbox.Chatrooms.Chatroom

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.header>
        {@page_title}
        <:subtitle>Use this form to manage chatroom records in your database.</:subtitle>
      </.header>

      <.form for={@form} id="chatroom-form" phx-change="validate" phx-submit="save">
        <.input field={@form[:title]} type="text" label="Title" />
        <.input field={@form[:video_link]} type="text" label="Video link" />
        <footer>
          <.button phx-disable-with="Saving..." variant="primary">Save Chatroom</.button>
          <.button navigate={return_path(@return_to, @chatroom)}>Cancel</.button>
        </footer>
      </.form>
    </Layouts.app>
    """
  end

  @impl true
  def mount(params, _session, socket) do
    {:ok,
     socket
     |> assign(:return_to, return_to(params["return_to"]))
     |> apply_action(socket.assigns.live_action, params)}
  end

  defp return_to("show"), do: "show"
  defp return_to(_), do: "index"

  defp apply_action(socket, :edit, %{"id" => id}) do
    chatroom = Chatrooms.get_chatroom!(id)

    socket
    |> assign(:page_title, "Edit Chatroom")
    |> assign(:chatroom, chatroom)
    |> assign(:form, to_form(Chatrooms.change_chatroom(chatroom)))
  end

  defp apply_action(socket, :new, _params) do
    chatroom = %Chatroom{}

    socket
    |> assign(:page_title, "New Chatroom")
    |> assign(:chatroom, chatroom)
    |> assign(:form, to_form(Chatrooms.change_chatroom(chatroom)))
  end

  @impl true
  def handle_event("validate", %{"chatroom" => chatroom_params}, socket) do
    changeset = Chatrooms.change_chatroom(socket.assigns.chatroom, chatroom_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"chatroom" => chatroom_params}, socket) do
    save_chatroom(socket, socket.assigns.live_action, chatroom_params)
  end

  defp save_chatroom(socket, :edit, chatroom_params) do
    case Chatrooms.update_chatroom(socket.assigns.chatroom, chatroom_params) do
      {:ok, chatroom} ->
        {:noreply,
         socket
         |> put_flash(:info, "Chatroom updated successfully")
         |> push_navigate(to: return_path(socket.assigns.return_to, chatroom))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_chatroom(socket, :new, chatroom_params) do
    case Chatrooms.create_chatroom(chatroom_params) do
      {:ok, chatroom} ->
        {:noreply,
         socket
         |> put_flash(:info, "Chatroom created successfully")
         |> push_navigate(to: return_path(socket.assigns.return_to, chatroom))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp return_path("index", _chatroom), do: ~p"/chatrooms"
  defp return_path("show", chatroom), do: ~p"/chatrooms/#{chatroom}"
end
