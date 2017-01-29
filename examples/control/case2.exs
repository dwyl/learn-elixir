#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Bouncer do
  dave = %{name: "Dave", age: 27}

  case dave do
    person = %{age: age} when is_number(age) and age >= 21 ->
      IO.puts "You are cleared to enter the Foo Bar, #{person.name}"
    _ ->
      IO.puts "Sorry, no admission"
  end
end
