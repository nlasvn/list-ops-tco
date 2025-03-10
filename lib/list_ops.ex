defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: do_count(l, 0)
  defp do_count([], acc), do: acc
  defp do_count([_ | t], acc), do: do_count(t, acc + 1)


  @spec reverse(list) :: list
  def reverse(l), do: do_reverse(l, [])
  defp do_reverse([], acc), do: acc
  defp do_reverse([h | t], acc), do: do_reverse(t, [h | acc])


  @spec map(list, (any -> any)) :: list
  def map(l, f), do: do_map(l, f, [])
  defp do_map([], _f, acc), do: reverse(acc)
  defp do_map([h | t], f, acc), do: do_map(t, f, [f.(h) | acc])


  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: do_filter(l, f, [])
  defp do_filter([], _f, acc), do: reverse(acc)
  defp do_filter([h | t], f, acc), do: if(f.(h), do: do_filter(t, f, [h | acc]), else: do_filter(t, f, acc))


  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([], acc, _f), do: acc
  def foldl([h | t], acc, f), do: foldl(t, f.(h, acc), f)


  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr([], acc, _f), do: acc
  def foldr([h | t], acc, f), do: f.(h, foldr(t, acc, f))


  @spec append(list, list) :: list
  def append(a, b), do: do_append(reverse(a), b)
  defp do_append([], b), do: b
  defp do_append([h | t], b), do: do_append(t, [h | b])


  @spec concat([[any]]) :: [any]
  def concat(l), do: foldl(reverse(l), [], &append/2)
end
