defmodule PhoenixElixirSandbox.Playground do
  def head_and_tail([head | tail]) do
    {:ok, %{head: head, tail: tail}}
  end
end

result = PhoenixElixirSandbox.Playground.head_and_tail([1,2,3])
IO.puts(result)
