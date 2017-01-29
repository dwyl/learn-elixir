#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Issues.CLI do

  @default_count 4

  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that end up generating a 
  table of the last _n_ issues in a github project
  """

  def run(argv) do
    argv 
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be -h or --help, which returns   `:help`.

  Otherwise it is a github user name, project name, and (optionally)
  the number of entries to format

  Return a tuple of `{ user, project, count }`, or `nil` if help was given.
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h:    :help   ])
    case parse do

    { [ help: true ], _,           _ } -> :help
    { _, [ user, project, count ], _ } -> { user, project,
                                            String.to_integer(count) }
    { _, [ user, project ],        _ } -> { user, project, @default_count }
    _                                  -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage:  issues <user> <project> [ count | #{@default_count} ]
    """
    System.halt(0)
  end

  def process({user, project, _count}) do
    Issues.GithubIssues.fetch(user, project)
  end
end
