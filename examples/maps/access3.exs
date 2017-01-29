#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
cast = %{
  buttercup: %{
    actor:    {"Robin", "Wright"},
    role:      "princess"
  },
  westley: %{
    actor:    {"Carey", "Elwes"},
    role:      "farm boy"
  }
}

IO.inspect get_in(cast, [Access.key(:westley), :actor, Access.elem(1)])
#=> "Elwes"

IO.inspect get_and_update_in(cast, [Access.key(:buttercup), :role],
                             fn (val) -> {val, "Queen"} end)
#=> {"princess",
#    %{buttercup: %{actor: {"Robin", "Wright"}, role: "Queen"},
#      westley: %{actor: {"Carey", "Elwes"}, role: "farm boy"}}}

                    
