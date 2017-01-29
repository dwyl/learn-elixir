#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Sequence.Mixfile do
  use Mix.Project

  def project do
    [
      app:     :sequence,
      version: "0.0.3",
      deps:    deps()
    ]
  end
  def application do
    [
      mod:          { Sequence, 456 },
      registered:   [ Sequence.Server ],
      applications: [ :logger ]
    ]
  end

  defp deps do
    [ exrm: "~> 1.0.6" ]
  end
end
