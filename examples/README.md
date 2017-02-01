# _Note on Code Examples_

Many (_most?_) of the Examples in this `/examples` dir
are either derived/adapted from or directly "_borrowed_"
from the _fantastic_ book:
Programming Elixir 1.3 by the _brilliant_ Dave Thomas! @pragdave

![Programming Elixir 1.3. front cover](https://cloud.githubusercontent.com/assets/194400/22402694/d13148de-e5f8-11e6-92cb-14584a353f7e.png)

Visit http://www.pragmaticprogrammer.com/titles/elixir13
for more book information.

We have not removed the copyright notice included in the original source file.
And the code was downloaded from:
https://pragprog.com/titles/elixir13/source_code

Where a modification is made we have noted this with a comment in the source.

> If you are learning Elixir from scratch the @dwyl tutorial will
only get you through your **_first_ hour**.

If you decide to _embrace_ Elixir
for your next personal or _client_
project we **_highly_ recommend** that you
**_immidiately_ purchase** Dave's _excellent_ book!
It is the _single_ best place/way to learn Elixir.
The book is _really_ well written, by a _seasoned_ technical writer
and has superb editorial "_coherence_"
from the great people of @pragprog.com

We have **_purchased_ several physical copies** of the Book for DWYL
these are being used by team members as reference guides.

If you are a _remote_ learner/team member and would like a _physical_
("hard") copy of the book please show your interest on
the issue on GitHub: https://github.com/dwyl/learn-elixir/issues/11

We will _mail_ a ***free*** (_paid for by DWYL_) copy of the book
to _any_ address in the world! Just get in touch!

Yes, we _know_ that Google has a _list_ of where you can download
the eBook _without_ paying for it:
https://www.google.com/search?q=Programming%20Elixir%201.3%20pdf

But we _strongly urge_ anyone who wants to _use_ Elixir in any
(_professional_) capacity to ***pay*** for the
(_~~hundreds~~ thousands of hours_) hard work Dave Thomas
and the "Prag Prog" team have put
into _crafting_ this superb learning resource!!

If you do _any_ work in Elixir the price of the book will be paid for
in the first couple of hours of work!
If you _want_ to do any ***paid*** work in Elixir
just look at the DWYL backlog and you can get paid
for your knowledge/skills/contributions ***immediately***!

_Happy Elixir Leaning Everyone_! :droplet: :heart: :white_check_mark: :rocket:

## Chapter 6 - Modules and Named Functions

Exercise 7 on page 63: find the library functions to do the following in `iex`:

+ [x] Convert a `float` to a `string` with **two decimal places** (Erlang)
```
# elixir just references erlang:
iex(1)> Float.to_string(1492.12345, decimals: 2)
"1492.12"
```
see: http://stackoverflow.com/questions/38734113/elixir-convert-float-to-string

+ [x] Get the _value_ of the Operating-System evironment name (Elixir)
```
iex(1)> :os.type()
{:unix, :darwin}
```
see: http://stackoverflow.com/questions/33461345/how-can-i-get-the-current-operating-system-name-in-elixir

+ [x] Return extension component of a file name (so return `.exs` for a
  given file `test.exs`) (Elixir)
```
Path.extname("test.exs")
".exs"
```
see: https://hexdocs.pm/elixir/Path.html#extname/1

+ [x] Return process's current working directory. (Elixir)
```
iex(1)> System.cwd()
"/dwyl/learn-elixir"
```
see: https://hexdocs.pm/elixir/System.html#cwd/0

+ [x] Convert a string containing JSON into Elixir data structures.
(_Just find; don't install_)
see: https://github.com/devinus/poison

+ [x] Execute a command in your operating system's shell
```
iex(1)> System.cmd("whoami", [])
{"Nelson\n", 0}
```
see: http://stackoverflow.com/questions/22594988/run-shell-commands-in-elixir
