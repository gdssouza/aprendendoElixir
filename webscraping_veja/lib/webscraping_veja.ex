defmodule WebScrapingVeja do
  def get_titles() do
    case HTTPoison.get("https://veja.abril.com.br/mundo/") do
      {:ok, %HTTPoison.Response{body: html}}
        -> html |> Floki.find("h2") |> get_titles()
      _ -> :erro
  end end
  def get_titles([]), do: []
  def get_titles([head|tail]) do
    {"h2", _href, [title]} = head
    [title | get_titles(tail)]
  end
end
