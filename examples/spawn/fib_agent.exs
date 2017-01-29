#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule FibAgent do
  def start_link do
    Agent.start_link(fn -> %{ 0 => 0, 1 => 1 } end)
  end
 
  def fib(pid, n) when n >= 0 do
    Agent.get_and_update(pid, &do_fib(&1, n))
  end
 
  defp do_fib(cache, n) do
    case cache[n] do
      nil ->
        { n_1, cache } = do_fib(cache, n-1)
        result         = n_1 + cache[n-2]
        { result, Map.put(cache, n, result) }

      cached_value ->
        { cached_value , cache }
    end
  end

end

{:ok, agent} = FibAgent.start_link()
IO.puts FibAgent.fib(agent, 2000)
