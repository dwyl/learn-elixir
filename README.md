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
After installing Elixir you can open the interactive shell by typing `iex`.
You can now type in any elixir expression and see the result in the terminal.

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

This section brings together the key information from Elixir's
[Getting Started](http://elixir-lang.org/getting-started/basic-types.html)
documentation and multiple other sources to further understanding.

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
Here we are saying that the method,
`process/1` will return a [tuple](#) response.
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

Tuples are similar to lists but are
[not suited to data sets that need to be updated or added to regularly](#lists-or-tuples).

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

Anonymous functions are closures (_named_ functions are not)
and as such they can access variables
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

## Generating your first Elixir project

To get started with your first Elixir project you need to make use of the [Mix](https://hexdocs.pm/mix/Mix.html) build tool that comes straight out of the box. Mix allows you to do a number of things including:

- Create projects
- Compile projects
- Run tasks
  - Testing
  - Generate documentation
- Manage dependencies

To generate a new project follow these steps:

1. Initialise a project by typing the following command in your terminal, replacing [project_name] with the name of your project:

```bash
> mix new [project_name]
```
We have chosen to call our project 'animals'

This will create a new folder with the given name of your project and should also print something that looks like this to the command line:

```bash
* creating README.md
* creating .gitignore
* creating mix.exs
* creating config
* creating config/config.exs
* creating lib
* creating lib/animals.ex
* creating test
* creating test/test_helper.exs
* creating test/animals_test.exs

Your Mix project was created successfully.
You can use "mix" to compile it, test it, and more:

    cd animals
    mix test

Run "mix help" for more commands.
```
Navigate to your newly created directory:

```bash
> cd animals
```
Open the directory in your text editor. You will be able to see that Elixir has
generated a few files for us that are specific to our project:

- `lib/animals.ex`
- `test/animals_test.ex`

2. Open up the `animals.ex` file in the lib directory. You should already
see some `hello-world` boilerplate like this:
```elixir
defmodule Animals do
  @moduledoc """
  Documentation for Animals.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Animals.hello
      :world

  """
  def hello do
    :world
  end
end
```
Elixir has created a module with the name of your project along with a function
that prints out a `:world` atom when called. It's also added boilerplate for
module and function documentation. (*we will go into more detail about
  documentation later*)

3. Let's test out the boilerplate code. In your project directory type the following
command:

```bash
> iex -S mix
```
What this basically means is, "Start the elixir interactive terminal and compile
with the context of my current project". This allows you to access modules and
functions created within the file tree.

Call the `hello-world` function given to us by Elixir. It should print out the
`:world` atom to the command line:

```bash
> Animals.hello
# :world
```

4. Let's start to create our own methods in the `Animals` module. Replace the
`hello-world` method with the following:
```elixir
@doc """
create_zoo returns a list of zoo animals

## Examples

    iex> Animals.create_zoo
    ["lion", "tiger", "gorilla", "elephant", "monkey", "giraffe"]

"""
def create_zoo do
  ["lion", "tiger", "gorilla", "elephant", "monkey", "giraffe"]
end
```
To run our new code we will first have to recompile our `iex`. This can be done
by typing:  
```bash
> recompile()
```
Now we will have access to the `create_zoo` method. Try it out in the command line:
```bash
> Animals.create_zoo
# ["lion", "tiger", "gorilla", "elephant", "monkey", "giraffe"]
```

4. Let's extend the `Animals` module. Let's say that you're visiting the zoo but
you can't decide which order to view the animals. We can create a `randomise` function
that takes a list of animals and returns a new list with a random order:

```elixir
@doc """
randomise takes a list of zoo animals and returns a new randomised list with
the same elements as the first.

## Examples

    iex> zoo = Animals.create_zoo
    iex> Animals.randomise(zoo)
    ["monkey", "tiger", "elephant", "gorilla", "giraffe", "lion"]

"""
def randomise(zoo) do
  Enum.shuffle(zoo)
end
```
Note we are making use of a pre-built module called `Enum` which has a list of
methods that you can use on enumerables such as lists. Documentation for `Enum`
methods can be found [here](https://hexdocs.pm/elixir/Enum.html)

5. Let's add another method to the `Animals` module. Let's say that we want to
find out if our zoo contains an animal:

```elixir
@doc """
contains? takes a list of zoo animals and a single animal and returns a boolean
as to whether or not the list contains the given animal.

## Examples

    iex> zoo = Animals.create_zoo
    iex> Animals.contains?(zoo, "gorilla")
    true
"""
def contains?(zoo, animal) do
  Enum.member?(zoo, animal)
end
```
**NOTE: It's convention when writing a function that returns a boolean to add a question
mark after the name of the method.**

6. Pattern matching example: Let's create a function that takes a list of animals and
the number of animals that you'd like to see and then returns a list of animals.

```elixir
@doc """
see_animals takes a list of zoo animals and the number of animals that
you want to see and then returns a list

## Examples

    iex> zoo = Animals.create_zoo
    iex> Animals.see_animals(zoo, 2)
    ["monkey", "giraffe"]
"""
def see_animals(zoo, count) do
  # Enum.split returns a tuple so we have to pattern match on the result
  # to get the value we want out
  {_seen, to_see} = Enum.split(zoo, -count)
  to_see
end
```

7. What if we want to save our list of animals to a file? Let's write a function
that will do this for us:

```elixir
@doc """
save takes a list of zoo animals and a filename and saves the list to that file

## Examples

    iex> zoo = Animals.create_zoo
    iex> Animals.save(zoo, "my_animals")
    :ok
"""
def save(zoo, filename) do
  # erlang is converting the zoo list to something that can be written to the
  # file system
  binary = :erlang.term_to_binary(zoo)
  File.write(filename, binary)
end
```

In your command line run the following:

```bash
> zoo = Animals.create_zoo
> Animals.save(zoo, "my_animals")
```
This will create a new file in your file tree with the name of the file that
you specified in the function. It will contain some odd characters for example this
is what gets returned for our animals file:

`�l   m   lionm   tigerm   gorillam   elephantm   monkeym   giraffej`

8. Now let's write a function that will allow us to access that information again:

```elixir
@doc """
load takes filename and returns a list of animals if the file exists

## Examples

    iex> Animals.load("my_animals")
    ["lion", "tiger", "gorilla", "elephant", "monkey", "giraffe"]

"""
def load(filename) do
  # here we are running a case expression on the result of File.read(filename)
  # if we receive an :ok then we want to return the list
  # if we receive an error then we want to give the user an error-friendly message
  case File.read(filename) do
    {:ok, binary} -> :erlang.binary_to_term(binary)
    {:error, _reason} -> "File does not exist"
  end
end
```

9. Pipe Operator. What if we wanted to call some of our functions in succession
to another. Let's create a function that creates a zoo, randomises it and then
returns a selected number of animals to go and see:

```elixir
@doc """
selection takes a number, creates a zoo, randomises it and then returns a list
of animals of length selected

## Examples

    iex> Animals.selection(2)
    ["gorilla", "giraffe"]

"""
def selection(number_of_animals) do
  # We are using the pipe operator here. It takes the value returned from
  # the expression and passes it down as the first argument in the expression
  # below. see_animals takes two arguments but only one needs to be specified
  # as the first is provided by the pipe operator
  Animals.create_zoo
  |> Animals.randomise
  |> Animals.see_animals(number_of_animals)
end
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
