# Learn ![elixir logo](http://elixir-lang.org/images/logo/logo.png "Elixir Logo")

Learn the Elixir _language_, designed to build dynamic, functional,
scalable and maintainable web applications!

## *Why*?

Elixir is scalable, efficient, and fault-tolerant. Things *will* go wrong with
code, and Elixir provides supervisors which describe how to restart parts of
your system when things don't go as planned.

There are **_many_ reasons** to learn elixir
and _use_ it for your next project!

### Key Advantages

+ Elixir is ***compiled*** and runs on the **Erlang VM** ("BEAM") which has been
_demostrated_ to be ***incredibly efficient***! see:
http://stackoverflow.com/questions/16779162/what-kind-of-virtual-machine-is-beam-the-erlang-vm
+ Many tiny processes (_as opposed to "threads"
which are more difficult to manage_)
+ Much better "_garbage collection_" than virtually any other VM
+ ***Functional*** language with _dynamic_ typing
+ ***Immutable Data*** so "***State***" is ***always predictable***! <br />
![image](https://cloud.githubusercontent.com/assets/194400/22413420/8a538bc2-e6af-11e6-80fd-209deb887820.png) <br />
+ ***High Reliability, Availability and Fault Tolerance*** (_because of Erlang_)
means apps built with elixir are run in production for ***Years***
without any "_downtime_"!
+ **WebSockets & Streaming** are baked-in
so "**real-time**" web apps are "_easy_"
(_or at least **easier** than many other languages!_)
+ ***Zero-Downtime Deployment*** is a _reality_ without any DevOps gymnastics!!!


## *What*?

[_**"Elixir is a dynamic, functional language designed for building scalable and
 maintainable applications."**_](http://elixir-lang.org/)

### Video Introduction

If you have a few minutes, probably the _easiest_ way to get _up-to-speed_
with what Elixir is <br />
(_and why we are **really excited** about it_),
is Pete Broderick's ***Intro to Elixir***: https://youtu.be/lly-1UYmnFI

<!-- note we should update this once we have
made our *own* intro to Elixir vid! -->

[![Pete Broderick - Intro to Elixir](https://cloud.githubusercontent.com/assets/194400/22414349/b41a24f0-e6b6-11e6-8e6e-6eb0c9ad188f.png)](https://youtu.be/lly-1UYmnFI "Click to Watch")

Another _fantastic_ introduction is: Jessica Kerr's <br />
***Elixir Should Take Over the World***: https://youtu.be/X25xOhntr6s

[![Jessica Kerr - Elixir Should Take Over the World](https://cloud.githubusercontent.com/assets/194400/22414453/7dad1232-e6b7-11e6-8399-ccac3d1b9446.png)](https://youtu.be/X25xOhntr6s "Why Elixir should take over the World!")

Then if you want to know what's _next_ it's worth watching  <br />
***What's Ahead for Elixir?***
by **José Valim** (_the creator of Elixir_): https://youtu.be/A60nxws_iVs

[![José Valim - What's Ahead for Elixir?](https://cloud.githubusercontent.com/assets/194400/22414818/8ef48248-e6ba-11e6-8b24-6643fc180f72.png)](https://youtu.be/A60nxws_iVs "What's Ahead for Elixir?")

> While Elixir by _itself_ is pretty _amazing_,
where the **_language_ really _shines_** is in the Phoenix Web Framework!!
So _once_ you know the _basics_ of the _language_,
https://github.com/dwyl/learn-phoenix-web-development


### Background links:

+ _Interview_ with **José Valim** (_the creator of Elixir_) on _why_ he made it!
https://www.sitepoint.com/an-interview-with-elixir-creator-jose-valim/
+ What was "_wrong_" with just writing directly in Erlang? read:
http://www.unlimitednovelty.com/2011/07/trouble-with-erlang-or-erlang-is-ghetto.html


## *How*?

How to install Elixir:
http://elixir-lang.org/getting-started/introduction.html

### Installation basics:

#### Mac:

`brew install elixir`

#### Ubuntu:

+ **_Add_ the Erlang Solutions repo**:

```
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
```
+ _**Run**_: `sudo apt-get update`
+ **_Install_ the Erlang/OTP platform and all of its applications**:
`sudo apt-get install esl-erlang`
+ **_Install_ Elixir**: `sudo apt-get install elixir`

## *Handy Tips*

### Interactive Terminal
After installing Elixir you can open the interactive shell by typing `iex`. You can now type in any elixir expression and see the result right  in the terminal.

### Function Documentation
If you want to see some information about a built-in function you can
just type `h` and the `function` name to get information on how to use it!

Try typing `h round` into the (iex) terminal and you should see
something like this:

![elixir-h](https://cloud.githubusercontent.com/assets/14013616/20860273/fc801b14-b96b-11e6-9b17-7e26666d5d94.png)

### Information about values
If you want to see some information about a value in your code,
type `i` followed by the value name:

![elixir-i](https://cloud.githubusercontent.com/assets/14013616/20860322/3c01d984-b96d-11e6-8cc4-a46c8657f5b4.png)

## *Basic Types*

Elixir has 7 basic types:

* `integers`
* `floats`
* `booleans`
* `atoms`
* `strings`
* `lists`
* `tuples`

This section brings together the key information from Elixir's [Getting Started](http://elixir-lang.org/getting-started/basic-types.html) documentation and multiple other sources to further understanding in a concise way.

### *Working with numbers:*

Try typing `1 + 2` into the terminal (after opening `iex`):
```elixir
iex> 1 + 2
3
```

Some more examples:

```elixir
iex> 5 * 5
10
iex> 10 / 2
5.0

# When using the `/` with two integers this gives a `float` (5.0).
# If you want to do integer division or get the division remainder
# you can use the `div` or `rem` functions
iex> div(10, 2)
5
iex> div 10, 2
5
iex> rem 10, 3
1
```

### *Booleans*

Elixir supports `true` and `false` as booleans.

```elixir
iex> true
true
iex> false
false

iex> is_boolean(true)
true
iex> is_boolean(1)
false
```

### *Atoms*

Atoms are constants where their name is their own value
(some other languages call these Symbols).

```elixir
iex> :hello
:hello
iex> :hello == :world
false
```

`true` and `false` are actually atoms in Elixir

Names of _modules_ in Elixir are also atoms. `MyApp.MyModule`
is a valid atom, even if no such module has been declared yet.

```elixir
iex> is_atom(MyApp.MyModule)
true
```

Atoms are also used to reference modules from Erlang libraries,
including built-in ones.

```elixir
iex> :crypto.rand_bytes 3
<<23, 104, 108>>
```

One popular use of atoms in Elixir is to use them as messages
for pattern matching.
Let's say you have a function which processes an `http` request.
The outcome of this process is either going to be a success or an error.
You could therefore use atoms to indicate whether
or not this process is successful.

```elixir
def process(file) do
  lines = file |> split_lines

  case lines do
    nil ->
      {:error, "failed to process file"}
    lines ->
      {:ok, lines}
  end
end
```
Here we are saying that the method, `process/1` will return a [tuple](#) response.
If the result of our process is successful, it will return `{:ok, lines}`,
however if it fails (e.g. returns nil) then it will return an error.
This will allows us to *pattern* match on this result.

```elixir
{:ok, lines} = process('text.txt')
```

Thus, we can be sure that we will always have the lines returned to us
and never a *nil* value (because it will throw an error).
This becomes extremely useful when piping multiple methods together.

### *Strings*

Strings are surrounded by double quotes.

```elixir
iex> "Hello World"
"Hello world"

# You can print a string using the `IO` module
iex> IO.puts "Hello world"
"Hello world"
:ok
```

### *Lists*

Elixir uses square brackets to make a list.

```elixir
iex> myList = [1,2,3]
iex> myList
[1,2,3]

iex> length(myList)
3

# concatenating lists together
iex> [1, 2, 3] ++ [4, 5, 6]
[1, 2, 3, 4, 5, 6]

# removing items from a list
iex> [1, true, 2, false, 3, true] -- [true, false]
[1, 2, 3, true]
```

Lists are enumerable, the [Enum](https://hexdocs.pm/elixir/Enum.html)
module provides lots of useful functions.

### *Tuples*

Elixir uses curly brackets to make a tuple.

Tuples are similar to lists but are [not suited to data sets that need to be updated or added to regularly](#lists-or-tuples).

```elixir
iex> tuple = {:ok, "hello"}
{:ok, "hello"}

# get element at index 1
iex> elem(tuple, 1)
"hello"

# get the size of the tuple
iex> tuple_size(tuple)
2
```

Tuples are not enumerable and there are far fewer functions available
in the [Tuple](http://elixir-lang.org/docs/v1.0/elixir/Tuple.html) module.
If you must treat your tuple as a list,
then convert it using `Tuple.to_list(your_tuple)`

### *Lists or Tuples?*

A long story short, for large lists or tuples:
+ `Updating` a `list` (adding or removing elements) is **fast**
+ `Updating` a `tuple` is **slow**


+ `Reading` a `list` (getting its length or selecting an element) is **slow**
+ `Reading` a `tuple` is **fast**

> source: http://stackoverflow.com/questions/31192923/lists-vs-tuples-what-to-use-and-when

## Functions and Modules

### Anonymous functions

Anonymous functions start with `fn` and end with `end`.


```elixir
iex> add = fn a, b -> a + b end

iex> add.(1, 2)
3
```

Note a dot `.` between the variable `add` and parenthesis is required
to invoke an anonymous function.

In Elixir, functions are `first class citizens` meaning that they can
be passed as arguments to other functions the same way integers and strings can.

```elixir
iex> is_function(add)
true
```

This uses the inbuilt function `is_function` which checks to see if
the parameter passed is a function and returns a bool.

Anonymous functions are closures (_named_ functions are not) and as such they can access variables
that are in scope when the function is defined.
You can define a new anonymous function that uses the `add`
anonymous function we have previously defined:

```elixir
iex> double = fn a -> add.(a, a) end

iex> double.(5)
10
```

These functions can be useful but will no longer be available to you.
If you want to make something more permanent then you can create a `module`.

### Modules

With modules you're able to group several functions together.
Most of the time it is convenient to write modules into files
so they can be compiled and reused.

Get started by creating a file named `math.ex`,
open it in your text editor and add the following code

```elixir
defmodule Math do
  def sum(a, b) do
    a + b
  end
end
```
In order to create your own modules in Elixir, use the `defmodule` macro,
then use the `def` macro to define functions in that module.
So in this case the module is `Math` and the function is `sum`.

Once this is saved the file can be compiled by typing `elixirc`
into the terminal followed by the file name.
```
$ elixirc math.ex
```

This will generate a file named `Elixir.Math.beam` containing the bytecode
for the defined module. If we start `iex` again, our module definition
will be available (provided that `iex` is started
  in the same directory the bytecode file is in):

```elixir
iex> Math.sum(1, 2)
3
```

## Resources

+ Crash Course in Elixir: http://elixir-lang.org/crash-course.html
+ Explanation video of Pattern Matching in Elixir: http://worldwide.chat/
+ Sign up to: https://elixirweekly.net/ for regular (_relevant_) updates!
+ List of _way_ more useful resources and sample apps:
https://github.com/h4cc/awesome-elixir

## tl;dr

> ***Note***: this is _definately **not**_ a "_reason_" to switch programming
languages, but _one_ of our (_totally unscientific_) reasons for deciding
to _investigate_ other options for programming languages was the fact
that JavaScript (_with the introduction of ES2015_) now has
***Six Ways to Declare a Function***:
https://rainsoft.io/6-ways-to-declare-javascript-functions/
which means that there is _ambiguity_ and "_debate_" as to which is
"_best practice_", Go, Elixir and Rust don't suffer from this problem.
Sure there are "_anonymous_" functions in Elixir
(_required for functional programming_!) but there are still only ***Two Ways***
to define a `function` (_and both have specific use-cases_),
which is _way_ easier to explain to a _beginner_ than the JS approach.
see:
http://stackoverflow.com/questions/18011784/why-are-there-two-kinds-of-functions-in-elixir
