#--- "prefix" reader exercise on p.43 of Programming Elixir 1.3

prefix = fn str1 ->
  fn str2 ->
    "#{str1} #{str2}"
  end
end

IO.puts prefix.("Hello").("World!")
mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")
