#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
cast = [
  %{
    character: "Buttercup",
    actor: %{
      first: "Robin",
      last:  "Wright"
    },
    role: "princess"
  },
  %{
    character: "Westley",
    actor: %{
      first: "Cary",
      last:  "Elwes"
    },
    role: "farm boy"
  }
]

IO.inspect get_in(cast, [Access.all(), :character])
#=> ["Buttercup", "Westley"]

IO.inspect get_in(cast, [Access.at(1), :role])
#=> "farm boy"

IO.inspect get_and_update_in(cast, [Access.all(), :actor, :last],
                             fn (val) -> {val, String.upcase(val)} end)
#=> {["Wright", "Ewes"],
#    [%{actor: %{first: "Robin", last: "WRIGHT"}, character: "Buttercup",
#       role: "princess"},
#     %{actor: %{first: "Cary", last: "EWES"}, character: "Westley",
#       role: "farm boy"}]}



                    
