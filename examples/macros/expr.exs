#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule T do

  def scan(quoted), do: _scan(quoted, [])

  def _scan({name, meta, params}, result) do
    [ _scan(name, result), _scan(meta, result), _scan(params, result) | result ]
  end

  def _scan(x, result) when is_atom(x), do: x
  def _scan({a,b}, result), do: [ _scan(a, result), _scan(b, result) | result ]
  def _scan([], result), do: []
  def _scan([h|t], result), do: [ _scan(h, result), _scan(t, result) | result ]

end

quoted = quote do a = b + c end
IO.inspect quoted
IO.inspect T.scan(quoted)