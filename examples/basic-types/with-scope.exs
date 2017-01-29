#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
content = "Now is the time"

lp  =  with {:ok, file}   = File.open("/etc/passwd"),
            content       = IO.read(file, :all),
            :ok           = File.close(file),
            [_, uid, gid] = Regex.run(~r/_lp:.*?:(\d+):(\d+)/, content)
       do
            "Group: #{gid}, User: #{uid}"
       end

IO.puts lp             #=> Group: 26, User: 26
IO.puts content        #=> Now is the time
