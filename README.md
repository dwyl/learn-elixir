# learn-elixir
Learn Elixir to build dynamic, functional, scalable and maintainable web applications!

<img src="http://elixir-lang.org/images/logo/logo.png" width="70%">

## *Why*?
Elixir is scalable, efficient, and fault-tolerant. Things *will* go wrong with
code, and Elixir provides supervisors which describe how to restart parts of
your system when things don't go as planned.

## *What*?
[_**"Elixir is a dynamic, functional language designed for building scalable and
 maintainable applications."**_](http://elixir-lang.org/)

#### Background links:
* [Introduction and Setup](http://elixir-lang.org/getting-started/introduction.html)
* [Getting started](http://elixir-lang.org/getting-started/basic-types.html)

## *How*?
You can see how to install Elixir [here](http://elixir-lang.org/getting-started/introduction.html)

#### Installation basics:
###### Mac:
`brew install elixir`

###### Ubuntu:
* **_Add_ Erlang Solutions repo**: wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
* _**Run**_: sudo apt-get update
* **_Install_ the Erlang/OTP platform and all of its applications**: sudo apt-get install esl-erlang
* **_Install_ Elixir**: sudo apt-get install elixir

## *Handy Tips*

#### Interactive Terminal
After installing Elixir you can open the interactive shell by typing: `iex`

#### Function Documentation
If you want to see some information about a built in function you can just type `h` and the `function` name to get information on how to use it!

Try typing `h round` into the (iex) terminal and you should see something like this:

![elixir-h](https://cloud.githubusercontent.com/assets/14013616/20860273/fc801b14-b96b-11e6-9b17-7e26666d5d94.png)

#### Information about values
If you want to see some information about a value in your code, type `i` followed by the value name:

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

#### *Working with numbers:*

try typing `1 + 2` into the terminal (after opening `iex`) and it should look like this
```elixir
iex> 1 + 2
3
```

Some more examples

```elixir
iex> 5 * 5
10
iex> 10 / 2
5.0

# When using the `/` with two integers this gives a `float` (5.0). If you want to do integer division or get the division remainder you can use the `div` or `rem` functions
iex> div(10, 2)
5
iex> div 10, 2
5
iex> rem 10, 3
1
```

#### *Booleans*

Elixir supports `true` and `false` as booleans

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

#### *Atoms*

Atoms are constants where their name is their own value (Some other languages call these Symbols)

```elixir
iex> :hello
:hello
iex> :hello == :world
false
```

`true` and `false` are actually atoms in Elixir

Names of modules in Elixir are also atoms. `MyApp.MyModule` is a valid atom, even if no such module has been declared yet.

```elixir
iex> is_atom(MyApp.MyModule)
true
```

Atoms are also used to reference modules from Erlang libraries, including built in ones.

```elixir
iex> :crypto.rand_bytes 3
<<23, 104, 108>>
```

One popular use of atoms in Elixir is to use them as messages for pattern matching.
Lets say you have a function which processes an http request. The outcome of this process is either going to be a success or an error. You could therefore use atoms to indicate whether or not this process is successful.

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
Here we are saying that the method, `process/1` will return a tuple response. If the result of our process is successful, it will return `{:ok, lines}`, however if it fails (e.g. returns nil) then it will return an error. This will allows us to *pattern* match on this result.

```elixir
{:ok, lines} = process('text.txt')
```

Thus, we can be sure that we will always have the lines returned to us and never a *nil* value (because it will throw an error). This becomes extremely useful when piping multiple methods together.

#### *Strings*

Strings are surrounded by double quotes

```elixir
iex> "Hello World"
"Hello world"

# You can print a string using the `IO` module
iex> IO.puts "Hello world"
"Hello world"
:ok
```

#### *Lists*

Elixir uses square brackets to make a list

```elixir
iex> myList = [1,2,3]
iex> myList
[1,2,3]

iex> length(myList)
3

# concatinating lists together
iex> [1, 2, 3] ++ [4, 5, 6]
[1, 2, 3, 4, 5, 6]

# removing items from a list
iex> [1, true, 2, false, 3, true] -- [true, false]
[1, 2, 3, true]
```

Lists are enumerable, the [Enum](https://hexdocs.pm/elixir/Enum.html) module provides lots of useful functions.

#### *Tuples*

Elixir uses curly brackets to make a tuple

Tuples are similar to lists but are not suited to modifying sets of data:

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

Tuples are not enumerable and there are far fewer functions available in the [Tuple](http://elixir-lang.org/docs/v1.0/elixir/Tuple.html) module. If you must treat your tuple as a list, then convert it using `Tuple.to_list(your_tuple)`

#### *Lists or Tuples?*

A long story short, for large lists or tuples:
* `Updating` a `list` (adding or removing elements) is **fast**
* `Updating` a `tuple` is **slow**


* `Reading` a `list` (getting its length or selecting an element) is **slow**
+ `Reading` a `tuple` is **fast**

> source: http://stackoverflow.com/questions/31192923/lists-vs-tuples-what-to-use-and-when

## Functions and Modules

##### Anonymous functions

Anonymous functions start with `fn` and end with `end`.


```elixir
iex> add = fn a, b -> a + b end

iex> add.(1, 2)
3
```

Note a dot `.` between the variable and parenthesis is required to invoke an anonymous function.

In Elixir, functions are `first class citizens` meaning that they can be passed as arguments to other functions the same way integers and strings can.

```elixir
iex> is_function(add)
true
```

This uses the inbuilt function `is_function` which checks to see if the parameter passed is a function and returns a bool.

Anonymous functions are closures and as such they can access variables that are in scope when the function is defined. You can define a new anonymous function that uses the `add` anonymous function we have previously defined

```elixir
iex> double = fn a -> add.(a, a) end

iex> double.(5)
10
```

These functions can be useful but will no longer be available to you. If you want to make something more permanent then you can create a `module`.

##### Modules
With modules you're able to group several functions together. Most of the time it is convenient to write modules into files so they can be compiled and reused.

Get started by creating a file named `math.ex`, open it in your text editor and add the following code

```elixir
defmodule Math do
  def sum(a, b) do
    a + b
  end
end
```
In order to create your own modules in Elixir, use the `defmodule` macro, then use the `def` macro to define functions in that module. So in this case the module is `Math` and the function is `sum`.

Once this is saved the file can be compiled by typing `elixirc` into the terminal followed by the file name.
```
$ elixirc math.ex
```

This will generate a file named `Elixir.Math.beam` containing the bytecode for the defined module. If we start `iex` again, our module definition will be available (provided that `iex` is started in the same directory the bytecode file is in):

```elixir
iex> Math.sum(1, 2)
3
```
