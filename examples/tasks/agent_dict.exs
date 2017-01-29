#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Frequency do
  
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def add_word(word) do
    Agent.update(__MODULE__, 
                 fn map ->
                      Map.update(map, word, 1, &(&1+1))
                 end)
  end

  def count_for(word) do
    Agent.get(__MODULE__, fn map -> map[word] end)
  end

  def words do
    Agent.get(__MODULE__, fn map -> Map.keys(map) end)
  end
  
end
