defmodule PhoenixElixirSandbox.ChatroomsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixElixirSandbox.Chatrooms` context.
  """

  @doc """
  Generate a chatroom.
  """
  def chatroom_fixture(attrs \\ %{}) do
    {:ok, chatroom} =
      attrs
      |> Enum.into(%{
        title: "some title",
        video_link: "some video_link"
      })
      |> PhoenixElixirSandbox.Chatrooms.create_chatroom()

    chatroom
  end
end
