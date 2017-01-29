#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defrecord Person, name: "", age: 0 do
  def say_hello(greeting, record) do
    IO.puts "#{greeting}, #{record.name}"
  end
end

m = Person.new name: "Methuselah", age: 969

m.say_hello "You look good for your age"
    