defmodule Matematica do
  def eh_primo(1), do: True
  def eh_primo(n), do: eh_primo(n, n-1)
  def eh_primo(_n, 1), do: True
  def eh_primo(n, div) do
    case rem(n, div) do
      0 -> False
      _ -> eh_primo(n, div-1)
    end
  end
end