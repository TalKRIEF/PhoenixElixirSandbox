defmodule PhoenixElixirSandboxWeb.ChatroomLiveTest do
  use PhoenixElixirSandboxWeb.ConnCase

  import Phoenix.LiveViewTest
  import PhoenixElixirSandbox.ChatroomsFixtures

  @create_attrs %{title: "some title", video_link: "some video_link"}
  @update_attrs %{title: "some updated title", video_link: "some updated video_link"}
  @invalid_attrs %{title: nil, video_link: nil}
  defp create_chatroom(_) do
    chatroom = chatroom_fixture()

    %{chatroom: chatroom}
  end

  describe "Index" do
    setup [:create_chatroom]

    test "lists all chatrooms", %{conn: conn, chatroom: chatroom} do
      {:ok, _index_live, html} = live(conn, ~p"/chatrooms")

      assert html =~ "Listing Chatrooms"
      assert html =~ chatroom.title
    end

    test "saves new chatroom", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/chatrooms")

      assert {:ok, form_live, _} =
               index_live
               |> element("a", "New Chatroom")
               |> render_click()
               |> follow_redirect(conn, ~p"/chatrooms/new")

      assert render(form_live) =~ "New Chatroom"

      assert form_live
             |> form("#chatroom-form", chatroom: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert {:ok, index_live, _html} =
               form_live
               |> form("#chatroom-form", chatroom: @create_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/chatrooms")

      html = render(index_live)
      assert html =~ "Chatroom created successfully"
      assert html =~ "some title"
    end

    test "updates chatroom in listing", %{conn: conn, chatroom: chatroom} do
      {:ok, index_live, _html} = live(conn, ~p"/chatrooms")

      assert {:ok, form_live, _html} =
               index_live
               |> element("#chatrooms-#{chatroom.id} a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/chatrooms/#{chatroom}/edit")

      assert render(form_live) =~ "Edit Chatroom"

      assert form_live
             |> form("#chatroom-form", chatroom: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert {:ok, index_live, _html} =
               form_live
               |> form("#chatroom-form", chatroom: @update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/chatrooms")

      html = render(index_live)
      assert html =~ "Chatroom updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes chatroom in listing", %{conn: conn, chatroom: chatroom} do
      {:ok, index_live, _html} = live(conn, ~p"/chatrooms")

      assert index_live |> element("#chatrooms-#{chatroom.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#chatrooms-#{chatroom.id}")
    end
  end

  describe "Show" do
    setup [:create_chatroom]

    test "displays chatroom", %{conn: conn, chatroom: chatroom} do
      {:ok, _show_live, html} = live(conn, ~p"/chatrooms/#{chatroom}")

      assert html =~ "Show Chatroom"
      assert html =~ chatroom.title
    end

    test "updates chatroom and returns to show", %{conn: conn, chatroom: chatroom} do
      {:ok, show_live, _html} = live(conn, ~p"/chatrooms/#{chatroom}")

      assert {:ok, form_live, _} =
               show_live
               |> element("a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/chatrooms/#{chatroom}/edit?return_to=show")

      assert render(form_live) =~ "Edit Chatroom"

      assert form_live
             |> form("#chatroom-form", chatroom: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert {:ok, show_live, _html} =
               form_live
               |> form("#chatroom-form", chatroom: @update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/chatrooms/#{chatroom}")

      html = render(show_live)
      assert html =~ "Chatroom updated successfully"
      assert html =~ "some updated title"
    end
  end
end
