defmodule Arquivos do
  def get_lines([], _keys), do: nil
  def get_lines([head|tail], keys) do
    if String.contains?(head, keys) do IO.puts(head) end
    get_lines(tail, keys)
  end
  def get_lines(text, keys) do
    get_lines(text |> String.split("\n", trim: true), keys)
  end

  def search(path, keys) do
    case File.read(path) do
      {:ok, text} -> get_lines(text, keys)
      {:error, msg} -> msg
    end
  end
end
