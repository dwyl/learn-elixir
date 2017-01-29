#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Listen.Prism do

  use GenFSM.Behaviour   

  @my_name :listen_to_call
  @timeout 30*1000

  defrecord CallInfo, from: "", to: "", suspicious_segments: 0

  # External API
  def start_link() do
    :gen_fsm.start_link({:local, @my_name}, __MODULE__, [], [])
  end

  # External events
  def call_initiated(from, to) do
    :gen_fsm.send_event(@my_name, {:call_initiated, from, to})
  end

  def suspicious_phrase_heard() do
    :gen_fsm.send_event(@my_name, :suspicious_phrase_heard)
  end

  def hang_up() do
    :gen_fsm.send_event(@my_name, :hang_up)
  end

  # Callbacks

  def init(_) do
    { :ok, :start, [] }
  end

  # START state

  def start({:call_initiated, from, to}, _call_info) do
    call_info = CallInfo.new(from: from, to: to)
    action("Start recording", call_info)
    { :next_state, :listening, call_info }
  end

  # LISTENING state

  def listening(:hang_up, call_info) do
    action("Hangup", call_info)
    { :next_state, :start, nil }

  end

   def listening(:suspicious_phrase_heard, call_info) do
    action("Heard something suspicious, starting transcription", call_info)
    { :next_state, :transcribing,                              
      call_info.update_suspicious_segments(&(&1+1)), @timeout } 
  end

  # TRANSCRIBING state
  def transcribing(:hang_up, call_info) do
    action("Report on call", call_info)
    { :next_state, :start, CallInfo.new }
  end

  def transcribing(:suspicious_phrase_heard, call_info) do
    action("More suspicious stuff, extending timeout", call_info)
    { :next_state, :transcribing, call_info, @timeout } 
  end

  def transcribing(:timeout, call_info) do     
    action("Stopping transcription", call_info)
    { :next_state, :listening, call_info }
  end


  # Helpers

  defp action(msg, CallInfo[from: from, 
                            to:   to, 
                            suspicious_segments: suspicious_segments]) do
    IO.puts("Call from #{from} to #{to}: #{msg}")
    if suspicious_segments > 0 do
      IO.puts("    (suspicious_segments: #{suspicious_segments})")
    end
  end
end
