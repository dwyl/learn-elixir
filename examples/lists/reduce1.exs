#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule MyList do

  @type element    :: any              
  @type value      :: any
  @type collection :: [ element ]

  @doc """
  Takes a list, an accumulator value, and a function. Applies the function
  to each element of the list in turn, also passing it the current accumulator
  value. The value returned by the function becomes the new accumulator.
  Returns the final value of the accumulator.

  ## Examples

          iex> MyList.reduce([1,2,3,4,5], 0, &(&1 + &2))
          15
          iex> MyList.reduce([1,2,3,4,5], 1, &(&1 * &2))
          120
    
  """
  @spec reduce(collection, value, (element,value -> value)) :: value   
 
  def reduce([head | tail], value, func) do 
    reduce(tail, func.(head, value), func)
  end
  def reduce([], value, _) do
    value 
  end
end

