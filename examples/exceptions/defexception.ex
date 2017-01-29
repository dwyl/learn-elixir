#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule KinectProtocolError do

  defexception message: "Kinect protocol error", 
               can_retry: false 

  def full_message(me) do
    "Kinect failed: #{me.message}, retriable: #{me.can_retry}"
  end

end

defmodule B do

  def talk_to_kinect do
    raise KinectProtocolError, message: "usb unplugged", can_retry: true
  end

  def schedule_retry do
    IO.puts "Retrying in 10 seconds"
  end

  def start do
    try do
      talk_to_kinect
    rescue
      error in [KinectProtocolError] ->
        IO.puts KinectProtocolError.full_message(error)
        if error.can_retry, do: schedule_retry
    end
  end
end

