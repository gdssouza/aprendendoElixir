defmodule Pagamentos do
  # soma duas listas multiplicando os valores de mesmo indice
  def costs([], []), do: []
  def costs([headA|tailA], [headB|tailB]), do: [headA*headB] ++ costs(tailA,tailB)

  # recebe lista de compras com os precos e retorna valor total
  def sum_costs([]), do: 0
  def sum_costs([head|tail]), do: head + sum_costs(tail)

  # recebe valor total e emails e retorna mapa
  def map(_value, _splitRest, []), do: %{}
  def map(value, 0, [head|tail] ), do: Map.put(map(value, 0, tail), head,value)
  def map(value, splitRest, [head|tail] ), do: Map.put(map(value, splitRest-1, tail), head, value+1)

  # validacao
  def challenge(_shoppingList, []), do: %{}
  def challenge([], _emailList), do: %{}
  # recebe compras e emails e retorna a resposta do teste
  def challenge([_itens, amount, prices], emailList) do
    # valor total da compra
    vlTotal = sum_costs(costs(amount, prices))
    # quantidade de emails
    lenEmails = Enum.count(emailList)
    # valor a pagar
    value = div(vlTotal, lenEmails)
    splitRest = rem(vlTotal, lenEmails)
    # construindo mapa
    map(value, splitRest, emailList)
  end
end
