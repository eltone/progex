defmodule MyEnum do
  def all?([], _), do: true

  def all?([head | xs], func) do
    func.(head) && all?(xs, func)
  end

  def each([], _), do: :ok

  def each([head | xs], func) do
    func.(head)
    each(xs, func)
  end

  def filter([], _), do: []

  def filter([head | xs], func) do
    if func.(head) do
      [head|filter(xs, func)]
    else
      filter(xs, func)
    end
  end

  def split(list, count, tuple \\ {[], []})

  def split([], _, {bef, aft}), do: {Enum.reverse(bef), Enum.reverse(aft)}

  def split([head | xs], count, {bef, aft}) when length(bef) < count do
    split(xs, count, {[head|bef], aft})
  end

  def split([head | xs], count, {bef, aft}) do
    split(xs, count, {bef, [head|aft]})
  end

  def take(list, count, taken \\ 0)

  def take([], _, _), do: []

  def take(_, count, taken) when taken >= count, do: []

  def take([head | xs], count, taken) do
    [head | take(xs, count, taken + 1)]
  end

  def flatten(list), do: _flatten(list, []) |> Enum.reverse

  defp _flatten([], flat), do: flat

  defp _flatten([head|tail], flat) when is_list(head) do
    _flatten(tail, _flatten(head, []) ++ flat)
  end

  defp _flatten([head|tail], flat) do
    _flatten(tail, [head|flat])
  end
end
