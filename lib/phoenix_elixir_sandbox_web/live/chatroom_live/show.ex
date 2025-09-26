defmodule PhoenixElixirSandboxWeb.ChatroomLive.Show do
  use PhoenixElixirSandboxWeb, :live_view

  alias PhoenixElixirSandbox.Chatrooms

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.header>
        Chatroom {@chatroom.id}
        <:subtitle>This is a chatroom record from your database.</:subtitle>
        <:actions>
          <.button navigate={~p"/chatrooms"}>
            <.icon name="hero-arrow-left" />
          </.button>
          <.button variant="primary" navigate={~p"/chatrooms/#{@chatroom}/edit?return_to=show"}>
            <.icon name="hero-pencil-square" /> Edit chatroom
          </.button>
        </:actions>
      </.header>

      <.list>
        <:item title="Title">{@chatroom.title}</:item>
        <:item title="Video link">{@chatroom.video_link}</:item>
      </.list>
    </Layouts.app>
    """
  end

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Show Chatroom")
     |> assign(:chatroom, Chatrooms.get_chatroom!(id))}
  end
end
