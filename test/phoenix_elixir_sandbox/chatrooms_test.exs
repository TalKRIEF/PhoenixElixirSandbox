defmodule PhoenixElixirSandbox.ChatroomsTest do
  use PhoenixElixirSandbox.DataCase

  alias PhoenixElixirSandbox.Chatrooms

  describe "chatrooms" do
    alias PhoenixElixirSandbox.Chatrooms.Chatroom

    import PhoenixElixirSandbox.ChatroomsFixtures

    @invalid_attrs %{title: nil, video_link: nil}

    test "list_chatrooms/0 returns all chatrooms" do
      chatroom = chatroom_fixture()
      assert Chatrooms.list_chatrooms() == [chatroom]
    end

    test "get_chatroom!/1 returns the chatroom with given id" do
      chatroom = chatroom_fixture()
      assert Chatrooms.get_chatroom!(chatroom.id) == chatroom
    end

    test "create_chatroom/1 with valid data creates a chatroom" do
      valid_attrs = %{title: "some title", video_link: "some video_link"}

      assert {:ok, %Chatroom{} = chatroom} = Chatrooms.create_chatroom(valid_attrs)
      assert chatroom.title == "some title"
      assert chatroom.video_link == "some video_link"
    end

    test "create_chatroom/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chatrooms.create_chatroom(@invalid_attrs)
    end

    test "update_chatroom/2 with valid data updates the chatroom" do
      chatroom = chatroom_fixture()
      update_attrs = %{title: "some updated title", video_link: "some updated video_link"}

      assert {:ok, %Chatroom{} = chatroom} = Chatrooms.update_chatroom(chatroom, update_attrs)
      assert chatroom.title == "some updated title"
      assert chatroom.video_link == "some updated video_link"
    end

    test "update_chatroom/2 with invalid data returns error changeset" do
      chatroom = chatroom_fixture()
      assert {:error, %Ecto.Changeset{}} = Chatrooms.update_chatroom(chatroom, @invalid_attrs)
      assert chatroom == Chatrooms.get_chatroom!(chatroom.id)
    end

    test "delete_chatroom/1 deletes the chatroom" do
      chatroom = chatroom_fixture()
      assert {:ok, %Chatroom{}} = Chatrooms.delete_chatroom(chatroom)
      assert_raise Ecto.NoResultsError, fn -> Chatrooms.get_chatroom!(chatroom.id) end
    end

    test "change_chatroom/1 returns a chatroom changeset" do
      chatroom = chatroom_fixture()
      assert %Ecto.Changeset{} = Chatrooms.change_chatroom(chatroom)
    end
  end
end
