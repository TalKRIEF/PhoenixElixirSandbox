defmodule PhoenixElixirSandbox.Playground do
  def head_and_tail([head | tail]) do
    {:ok, %{head: head, tail: tail}}
  end

  def unwrap({:ok, value}), do: value
  def unwrap({:error, msg}), do: "Error, #{msg}"

  def extract_id(%{"id" => id}), do: {:ok, id}
  def extract_id(_), do: {:error, :no_id} # Can replace :no_id by string  ie "No ID if wanted "
end

defmodule PhoenixElixirSandbox.Pipeline do
  def normalize_url(url) do
    url
    |> String.trim()
    |> String.downcase()
    |> String.replace("watch?v=", "embed/")
  end
end

defmodule PhoenixElixirSandbox.Variables do
  def first_map do
    map = %{a: 1, b: 2}
    IO.puts("#{map}")
  end
end
