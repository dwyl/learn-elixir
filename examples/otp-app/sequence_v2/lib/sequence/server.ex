#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Sequence.Server do
  use GenServer
  require Logger

  @vsn "1"
  defmodule State do
    defstruct current_number: 0, stash_pid: nil, delta: 1
  end

  #####
  # External API  

  def start_link(stash_pid) do
    GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def next_number do
    with number = GenServer.call(__MODULE__, :next_number),
    do: "The next number is #{number}"
  end

  def increment_number(delta) do
    GenServer.cast __MODULE__, {:increment_number, delta}
  end

  #####
  # GenServer implementation

  def init(stash_pid) do
    current_number = Sequence.Stash.get_value stash_pid
    { :ok,
      %State{current_number: current_number, stash_pid: stash_pid} }
  end

  def handle_call(:next_number, _from, state) do 
    { :reply,
      state.current_number,
      %{ state | current_number: state.current_number + state.delta} }
  end

  def handle_cast({:increment_number, delta}, state) do
    {:noreply,
     %{ state | current_number: state.current_number + delta, delta: delta} }
  end

  def terminate(_reason, state) do
    Sequence.Stash.save_value state.stash_pid, state.current_number
  end
  
  def code_change("0", old_state = { current_number, stash_pid }, _extra) do
    new_state = %State{current_number: current_number, 
                       stash_pid: stash_pid,
                       delta: 1
                      }
    Logger.info "Changing code from 0 to 1"
    Logger.info inspect(old_state)
    Logger.info inspect(new_state)
    { :ok, new_state }
  end
end
