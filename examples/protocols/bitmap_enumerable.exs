#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defimpl Enumerable,  for: Bitmap do
  import :math, only: [log: 1]

  def reduce(bitmap, {:cont, acc}, fun) do
    bit_count =  Enum.count(bitmap)
    _reduce({bitmap, bit_count}, { :cont, acc }, fun)
  end

  defp _reduce({_bitmap, -1}, { :cont, acc }, _fun), do: { :done, acc }

  defp _reduce({bitmap, bit_number}, { :cont, acc }, fun) do
    with bit = Bitmap.fetch_bit(bitmap, bit_number),
    do:  _reduce({bitmap, bit_number-1}, fun.(bit, acc), fun)
  end

  defp _reduce({_bitmap, _bit_number}, { :halt, acc }, _fun), do: { :halted, acc }

  defp _reduce({bitmap, bit_number}, { :suspend, acc }, fun), 
  do: { :suspended, acc, &_reduce({bitmap, bit_number}, &1, fun), fun } 

  def member?(value, bit_number) do
    { :ok, 0 <= bit_number && bit_number < Enum.count(value) }
  end

  def count(%Bitmap{value: value}) do              
    { :ok, trunc(log(abs(value))/log(2)) + 1 }
  end
end


fifty = %Bitmap{value: 50}

IO.puts Enum.count fifty    # => 6

IO.puts Enum.member? fifty, 4    # => true
IO.puts Enum.member? fifty, 6    # => false

IO.inspect Enum.reverse fifty       # => [0, 1, 0, 0, 1, 1, 0]
IO.inspect Enum.join fifty, ":"     # => "0:1:1:0:0:1:0"

