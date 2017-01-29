#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defrecord MyList, list: []

defimpl Enumerable, for: MyList do

  def reduce(MyList[list: list], acc, fun), do: _reduce(list, acc, fun)

  def _reduce([h|t], acc, fun) do
    _reduce(t, fun.(h, acc), fun)
  end

  def _reduce([], acc, _fun) do
    acc
  end


  def member?(collection, value) do
    Enum.member?(collection.list, value)
  end

  def count(collection) do
    length(collection.list)
  end

end

my_list = MyList.new list: [1, 2, 3]

IO.puts(Enum.count my_list)
IO.puts(Enum.member? my_list, 3)
Enum.each my_list, IO.puts(&1)
