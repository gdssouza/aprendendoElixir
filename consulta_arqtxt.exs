defmodule Arquivos do
  def encontra_linhas([], _keys), do: nil
  def encontra_linhas([head|tail], keys) do
    if String.contains?(head, keys) do IO.puts(head) end
    encontra_linhas(tail, keys)
  end
  def encontra_linhas(texto, keys) do
    encontra_linhas(texto |> String.split("\n", trim: true), keys)
  end

  def consulta(caminho, keys) do
    case File.read(caminho) do
      {:ok, texto} -> encontra_linhas(texto, keys)
      {:error, msg} -> msg
    end
  end
end
