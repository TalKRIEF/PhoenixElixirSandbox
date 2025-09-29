defmodule PhoenixElixirSandboxWeb.ChatroomLive.Index do
  use PhoenixElixirSandboxWeb, :live_view

  alias PhoenixElixirSandbox.Chatrooms

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.header>
        Listing Chatrooms
        <:actions>
          <.button variant="primary" navigate={~p"/chatrooms/new"}>
            <.icon name="hero-plus" /> New Chatroom
          </.button>
        </:actions>
      </.header>

      <.table
        id="chatrooms"
        rows={@streams.chatrooms}
        row_click={fn {_id, chatroom} -> JS.navigate(~p"/chatrooms/#{chatroom}") end}
      >
        <:col :let={{_id, chatroom}} label="Title">{chatroom.title}</:col>

        <:col :let={{_id, chatroom}} label="Creator">
          <%= if chatroom.user do %>
            {chatroom.user.name}
          <% else %>
            <span class="text-gray-400 italic">Aucun utilisateur</span>
          <% end %>
        </:col>

        <:col :let={{_id, chatroom}} label="Video link">{chatroom.video_link}</:col>
        <:action :let={{_id, chatroom}}>
          <div class="sr-only">
            <.link navigate={~p"/chatrooms/#{chatroom}"}>Show</.link>
          </div>
          <.link navigate={~p"/chatrooms/#{chatroom}/edit"}>Edit</.link>
        </:action>
        <:action :let={{id, chatroom}}>
          <.link
            phx-click={JS.push("delete", value: %{id: chatroom.id}) |> hide("##{id}")}
            data-confirm="Are you sure?"
          >
            Delete
          </.link>
        </:action>
      </.table>
    </Layouts.app>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    chatrooms = Chatrooms.list_chatrooms()

    {:ok,
     socket
     |> assign(:page_title, "Chatroom Index")
     |> stream(:chatrooms, chatrooms)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    chatroom = Chatrooms.get_chatroom!(id)
    {:ok, _} = Chatrooms.delete_chatroom(chatroom)

    {:noreply, stream_delete(socket, :chatrooms, chatroom)}
  end
end
