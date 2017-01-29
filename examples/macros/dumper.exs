#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule My do
  defmacro macro(param) do
    IO.inspect param
  end
end

defmodule Test do
  require My

  # These values represent themselves
  My.macro :atom        #=> :atom
  My.macro 1            #=> 1
  My.macro 1.0          #=> 1.0
  My.macro [1,2,3]      #=> [1,2,3]
  My.macro "binaries"   #=> "binaries"
  My.macro { 1, 2 }     #=> {1,2}
  My.macro do: 1        #=> [do: 1]

  # And these are represented by 3-element tuples

  My.macro { 1,2,3,4,5 }
  # =>  {:"{}",[line: 20],[1,2,3,4,5]}

  My.macro do: ( a = 1; a+a )
  # =>  [do:
  #      {:__block__,[],
  #        [{:=,[line: 22],[{:a,[line: 22],nil},1]},
  #         {:+,[line: 22],[{:a,[line: 22],nil},{:a,[line: 22],nil}]}]}]


  My.macro do
    1+2
  else
    3+4
  end
  # =>   [do: {:+,[line: 24],[1,2]},
  #       else: {:+,[line: 26],[3,4]}]

end
