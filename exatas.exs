defmodule Matematica do
  def is_prime(1), do: True
  def is_prime(n), do: is_prime(n, n-1)
  def is_prime(_n, 1), do: True
  def is_prime(n, div) do
    case rem(n, div) do
      0 -> False
      _ -> is_prime(n, div-1)
    end
  end

  def is_even(n) do
    case rem(n, 2) do
      0 -> True
      _ -> False
    end
  end

  def fibo(1), do: 1
  def fibo(2), do: 1
  def fibo(n), do: fibo(n-1)+fibo(n-2)
end
