defmodule PhoenixElixirSandbox.Playground do
  def head_and_tail([head | tail]) do
    {:ok, %{head: head, tail: tail}}
  end

  def unwrap({:ok, value}), do: value
  def unwrap({:error, msg}), do: "Error, #{msg}"
end
