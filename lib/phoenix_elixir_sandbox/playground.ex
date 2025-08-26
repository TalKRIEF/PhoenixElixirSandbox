defmodule PhoenixElixirSandbox.Playground do
  def head_and_tail([head | tail]) do
    {:ok, %{head: head, tail: tail}}
  end
end
