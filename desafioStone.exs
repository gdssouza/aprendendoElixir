defmodule Pagamentos do
  # soma duas listas multiplicando os valores de mesmo indice
  def custos([], []), do: []
  def custos([headA|tailA], [headB|tailB]), do: [headA*headB] ++ custos(tailA,tailB)

  # recebe lista de compras com os precos e retorna valor total
  def soma([]), do: 0
  def soma([head|tail]), do: head + soma(tail)

  # recebe valor total e emails e retorna mapa
  def mapa(valor, resto, []), do: %{}
  def mapa(valor, 0, [head|tail] ), do: Map.put(mapa(valor, 0, tail), head, valor)
  def mapa(valor, resto, [head|tail] ), do: Map.put(mapa(valor, resto-1, tail), head, valor+1)

  # validacao
  def desafio(listaCompras, []), do: %{}
  def desafio([], listaEmails), do: %{}
  # recebe compras e emails e retorna a resposta do teste
  def desafio([itens, qtds, precos], listaEmails) do
    # valor total da compra
    vlTotal = soma(custos(qtds, precos))
    # quantidade de emails
    lenEmails = Enum.count(listaEmails)
    # valor a pagar
    valor = div(vlTotal, lenEmails)
    resto = rem(vlTotal, lenEmails)
    # construindo mapa
    mapa(valor, resto, listaEmails)
  end
end
