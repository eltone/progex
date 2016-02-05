defmodule MyList do
  def mapsum([], _), do: 0

  def mapsum([head|tail], func) do
    func.(head) + mapsum(tail, func)
  end

  def maxlist(list) do
    _maxlist(list)
  end

  defp _maxlist(list, max \\ 0)

  defp _maxlist([], max), do: max

  defp _maxlist([head|tail], max) when head > max do
    _maxlist(tail, head)
  end

  defp _maxlist([head|tail], max) when head <= max do
    _maxlist(tail, max)
  end

  def caesar([], _), do: []

  def caesar([head|tail], n) do
    [wrapped_add(head, n) | caesar(tail, n)]
    |> to_string
  end

  defp wrapped_add(c, n) when c + n > ?z do
    ?a + c + n - ?z - 1
  end

  defp wrapped_add(c,n) do
    c + n
  end

  def span(from, to) when from > to do
    raise ArgumentError, message: "from is greater than to"
  end

  def span(from, to) do
    _span(from, [to])
  end

  defp _span(from, list = [head | _]) when head == from do
    list
  end

  defp _span(from, list = [head | _]) do
    _span(from, [head - 1 | list])
  end

  def primes(max) do
    for x <- span(2,max), prime?(x), do: x
  end

  defp prime?(2), do: true

  defp prime?(num) do
    !Enum.any?(2..(num-1), &(rem(num, &1) == 0))
  end
end
