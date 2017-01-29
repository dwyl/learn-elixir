#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

defmodule User do
  report = %BugReport{owner: %Customer{name: "Dave", company: "Pragmatic"},
                      details: "broken"}

  IO.inspect report

  report = %BugReport{ report | owner: %Customer{ report.owner | company: "PragProg" }}

  IO.inspect report

  IO.inspect update_in(report.owner.name, &("Mr. " <> &1))
end
