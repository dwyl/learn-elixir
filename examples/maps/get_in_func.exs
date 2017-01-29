#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
authors = [
  %{ name: "José",  language: "Elixir" },
  %{ name: "Matz",  language: "Ruby" },
  %{ name: "Larry", language: "Perl" }
]

languages_with_an_r = fn (:get, collection, next_fn) ->
   for row <- collection do
     if String.contains?(row.language, "r") do
       next_fn.(row)
     end
   end
end

IO.inspect get_in(authors, [languages_with_an_r, :name]) 
#=> [ "José", nil, "Larry" ]  
