#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Dictionary do

  @name __MODULE__

  ##
  # External API

  def start_link, 
  do: Agent.start_link(fn -> %{} end, name: @name)

  def add_words(words),
  do: Agent.update(@name, &do_add_words(&1, words))

  def anagrams_of(word),
  do: Agent.get(@name, &Map.get(&1, signature_of(word)))

  ##
  # Internal implementation

  defp do_add_words(map, words),
  do: Enum.reduce(words, map, &add_one_word(&1, &2))
  
  defp add_one_word(word, map),
  do: Map.update(map, signature_of(word), [word], &[word|&1])

  defp signature_of(word),
  do: word |> to_charlist |> Enum.sort |> to_string

end

defmodule WordlistLoader do
  def load_from_files(file_names) do
    file_names
    |> Stream.map(fn name -> Task.async(fn -> load_task(name) end) end)
    |> Enum.map(&Task.await/1)
  end

  defp load_task(file_name) do
    File.stream!(file_name, [], :line)
    |> Enum.map(&String.strip/1)
    |> Dictionary.add_words
  end
end

