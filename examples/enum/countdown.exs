#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Countdown do

  def sleep(seconds) do
    receive do
      after seconds*1000 -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd('say #{text}') end
  end

  def timer do
    Stream.resource(
      fn ->          # the number of seconds to the start of the next minute
         {_h,_m,s} = :erlang.time
         60 - s - 1
      end,

      fn             # wait for the next second, then return its countdown
        0 ->
          {:halt, 0}

        count ->
          sleep(1)
          { [inspect(count)], count - 1 }
      end,

      fn _ -> nil end   # nothing to deallocate
    )
  end
end
