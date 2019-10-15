# _Reusing_ Elixir - How to Use + _Publish_ Code on Hex.pm 📦

Once you understand basic Elixir syntax
you may be wondering how to reuse
both your own code across projects
and other people's code in your projects ...
That's what we are going to cover today!

<!--
If you are rewriting the same code
("_reinventing the wheel_")
in each new project
you have not understood
a fundamental goal of software engineering:
reuse code.
-->

> "_Code reuse is the Holy Grail of Software Engineering._"
~ Douglas Crockford

<!--
If you aren't reusing code (_both your own and other people's_),
you're doing it wrong.

![grumpy-cat-you-re-doing-it-wrong](https://user-images.githubusercontent.com/194400/65946493-30363c00-e42e-11e9-81c7-7267ac7ab47b.png)
-->

The more (_high quality_) code you are able to reuse,
the more creative and interesting work you can do
because you aren't wasting time
reimplementing basic functionality
or writing boring
["boilerplate"](https://en.wikipedia.org/wiki/Boilerplate_code).


# TODO: Add Contents List `#helpwanted`

This tutorial has several sections
because it is a start-to-finish creation,
publish and consume of a module on Hex.pm.
We need a simple contents list similar to
the main `README.md`:
https://github.com/dwyl/learn-elixir/blame/master/README.md#L3 <br />
This will help people rapidly navigate
to the section they are most interested in.




# Why?

> "_Good programmers
know what to write.
Great ones know what
to rewrite_ (_and **reuse**_).". <br />
~ Eric S. Raymond (The Cathedral and the Bazaar)

The biggest advantages of code reuse are:
+ Independently tested small pieces of code
that do only one thing.
([Curly's Law](https://blog.codinghorror.com/curlys-law-do-one-thing)) 🥇
+ Work can be subdivided among people/teams with clear responsibilities. <br />
Or if you are solo developer,
having small chunks of code helps you bitesize your work
so it's more manageable. 🙌
+ Leverage _other_ people's code
to reduce your own efforts
and ship faster. 🚀

> "_If I have seen further than others, it is by standing upon the shoulders of giants._"
~ [Isaac Newton](https://en.wikiquote.org/wiki/Isaac_Newton)

We can adapt this quote to a software engineering context as:

> "_If I have shipped faster and more interesting apps
it is by building on the work of giants._"
~ Every Experienced Developer


# What?

In this example we are going to build a simple Elixir module
that returns a **random inspiring quote**
when the main function is invoked. <br />
The functionality of the module is _intentionally_
simple to illustrate code reuse in the most basic form. <br />
Along the way we will demonstrate how to:
1. Write, document and test a basic package.  
2. Reuse code _without_ publishing to Hex.pm.
3. Publish a package to Hex.pm
4. Use the code it in a different project.

## Quotes?

A quotation, often abbreviated to quote,
is the repetition of someone else's statement or thought. <br />
Quotes are usually an expression of wisdom in a concise form.
They often condense a lifetime of learning into a single sentence
and as such are worthy of our attention.

In our example we will be focussing on
a subset of quotes; the thought-provoking kind
(_often called inspirational or motivational_). <br />
e.g:

> "_If you think you are too small to make a difference,
try sleeping with a mosquito._"
~ [Dalai Lama](https://www.goodreads.com/quotes/7777-if-you-think-you-are-too-small)

> "_Your time is limited,
so don’t waste it living someone else’s life._"
~ [Steve Jobs](https://www.goodreads.com/quotes/374630-your-time-is-limited)

> "_If you get tired, learn to rest, not to quit._"
~ [Banksy](https://www.goodreads.com/quotes/8225454-if-you-get-tired-learn-to-rest)


There are _many_ uses for quotes.
If you're having trouble thinking of how/why this is useful.
Imagine a browser home page
that displays a different inspiring/motivating/uplifting quote
each time you view it
to remind you
to stay focussed/motivated
on your goal for the day.<sup>[1](#example-use-case-momentum-dashboard)</sup>


## Problem Statement

> “_First, solve the problem. Then, write the code_.” ~ John Johnson

The problem we are solving in this example
is: we want to display quotes on our app/website
home screen.<sup>[1](#example-use-case-momentum-dashboard)</sup>

First we will source some quotes.
Then we will create an Elixir module,
that when invoked
returns a random
quote to display.

When `Quotes.random()` is invoked
a `map` will be returned with the following form:

```elixir
%{
  "author" => "Peter Drucker",
  "source" => "https://www.goodreads.com/quotes/784267",
  "tags" => "time, management",
  "text" => "Until we can manage time, we can manage nothing else."
}
```



# How?

This is a step-by-step example of creating
a resuable Elixir package from scratch.



## 1. Write _Useable_ Code

> "_Before software can be reusable,
it first has to be usable._"
~ Ralph Johnson


### 1.1 Create a GitHub New Repository

Our _first step_ is always to write _useable_ code.
Let's begin by creating a new repository: https://github.com/new

![quotes-github-repo](https://user-images.githubusercontent.com/194400/66130610-e09c6f80-e5e9-11e9-9252-5edbe6d845fb.png)


Once you've created the repository,
create an issue with the first task.
e.g:

![quotes-first-issue](https://user-images.githubusercontent.com/194400/66130977-85b74800-e5ea-11e9-9337-f4325736c252.png)

This makes it clear to _yourself_ (_and others_) what the next step is.

### 1.2 Create an Elixir Project

In a terminal window on your `localhost`,
run the following command:

```sh
mix new quotes
```

That will create all the files needed for our **`quotes`** package. <br />
The code created by `mix new` is:
[commit/14e7a08](https://github.com/dwyl/quotes/commit/14e7a084360687510f9bb18925f022065d797ab9)


Using the [`tree`](https://rschu.me/list-a-directory-with-tree-command-on-mac-os-x-3b2d4c4a4827)
command (`tree -a` lists all files the directory tree
  and `-I '.git'` just means "ignore .git directory"):
```
tree -a -I '.git'
```
We see that our directory/file structure for the project is:

```
├── .formatter.exs
├── .gitignore
├── LICENSE
├── README.md
├── lib
│   └── quotes.ex
├── mix.exs
└── test
    ├── quotes_test.exs
    └── test_helper.exs
```

The interesting/relevant files are these four:
```
├── lib
│   └── quotes.ex
├── mix.exs
└── test
    ├── quotes_test.exs
    └── test_helper.exs
```


`lib/quotes.ex`
```elixir
defmodule Quotes do
  @moduledoc """
  Documentation for Quotes.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Quotes.hello()
      :world

  """
  def hello do
    :world
  end
end
```

On creation, the `Quotes` module
has a `hello` function that
returns the `:world` atom.
This is standard in newly created Elixir projects.
It will eventually contain our `random` function.


`mix.exs`
```elixir
defmodule Quotes.MixProject do
  use Mix.Project

  def project do
    [
      app: :quotes,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
```

The `mix.exs` file is the configuration file for the project/package.
+


`test/quotes_test.exs`
```elixir
defmodule QuotesTest do
  use ExUnit.Case
  doctest Quotes

  test "greets the world" do
    assert Quotes.hello() == :world
  end
end
```

`test/test_helper.exs`
```elixir
ExUnit.start()
```

### Run the Tests

Before writing any code,
run the tests to ensure that everything
you _expect_ to be working is in fact working:

```sh
mix test
```

You should see something like this:

```sh
==> jason
Compiling 8 files (.ex)
Generated jason app
==> quotes
Compiling 2 files (.ex)
Generated quotes app
..

Finished in 0.02 seconds
1 doctest, 1 test, 0 failures

Randomized with seed 771068
```

That informs us that `jason`
(_the dependncy we downloaded previously_)
compiled successfully as did the `quotes` app.

It also tells us: **1 doctest, 1 test, 0 failures**.
The doctest (_see below_)
which is the "living documentation"
for the `hello` function
executed the example successfully.

Recall that the Example in the `@doc` block is:
```elixir
@doc """
Hello world.

## Examples

    iex> Quotes.hello()
    :world

"""
def hello do
  :world
end
```

If you open `iex` in your terminal
by running `iex -S mix`
and then input the module and function and run it,
you will see the `:world` atom as the result:
```elixir
iex> Quotes.hello()
:world
```

Doctests are an _awesome_ way of documenting functions
because if the function changes
the doctest _must_ change with it
to avoid breaking.

### Update the `hello` function

If we updated the `hello` function
to return the atom `:kitty` instead of `:world`
the doctest will fail.

Try it!
Open the `lib/quotes.ex` file
and change the `hello` function
from:

```elixir
def hello do
  :world
end
```

To:

```elixir
def hello do
  :kitty
end
```
(_don't update the Example yet_)

Rerun the tests:
```sh
mix test
```

```
1) test greets the world (QuotesTest)
   test/quotes_test.exs:5
   Assertion with == failed
   code:  assert Quotes.hello() == :world
   left:  :kitty
   right: :world
   stacktrace:
     test/quotes_test.exs:6: (test)



2) doctest Quotes.hello/0 (1) (QuotesTest)
   test/quotes_test.exs:3
   Doctest failed
   doctest:
     iex> Quotes.hello()
     :world
   code:  Quotes.hello() === :world
   left:  :kitty
   right: :world
   stacktrace:
     lib/quotes.ex:11: Quotes (module)



Finished in 0.03 seconds
1 doctest, 1 test, 2 failures
```

The doctest failed because the function was updated.

> It might seem redundant to have _two_
(_similar_) tests for the same function.
In this simplistic example
both the doctest and ExUnit test
are testing for the same thing
`assert Quotes.hello() == :world`
but the difference is that the doctest
example will be included in the module/function's documentation.
Always keep in mind that people using your code (_including yourself_)
might not read the tests,
but they will rely on the docs
so writing doctests are an excellent step.

Change the `hello` function back
to what it was before
(_returning `:world`_)
and let's move on.

Before we can return quotes,
we need _source_ a bank of quotes!


### Get Quotes!

Now that we have the basics of an Elixir project,
our next task is to create (_or find_) a list of quotes.

We could _manually_ compile our list of quotes
by combing through a few popular quotes websites.
e.g:

+ Wikiquote: https://en.wikiquote.org/wiki/Motivation
+ Brainyquote: https://www.brainyquote.com/topics/motivational-quotes
+ Goodreads: https://www.goodreads.com/quotes

_Or_ we can feed our favourite search engine
with specific targeted keywords.
e.g:
"***inspirational quotes database json free***"

Again there are _many_ results so we need do some sifting ...

+ https://github.com/public-apis/public-apis
+ https://opendata.stackexchange.com/questions/3488/large-list-of-quotes
  + https://stackoverflow.com/questions/13762688/wiki-quotes-api
+ https://type.fit/api/quotes
+ https://github.com/JamesFT/Database-Quotes-JSON
+ https://github.com/lukePeavey/quotable
+ [https://github.com/skolakoda/programming-quotes-api](https://github.com/skolakoda/programming-quotes-api/blob/master/backup/quotes.json)
+ [https://github.com/jamesseanwright/ron-swanson-quotes](https://github.com/jamesseanwright/ron-swanson-quotes/blob/master/quotes.js)

Abracadabra hey presto!

```JSON
[
  {
    "text": "If I know how you spend your time, then I know what might become of you.",
    "author": "Goethe",
    "source": "https://www.goodreads.com/quotes/6774650",
    "tags": "time, effectiveness"
  },
  {
    "text": "Until we can manage time, we can manage nothing else.",
    "author": "Peter Drucker",
    "source": "https://www.goodreads.com/quotes/784267",
    "tags": "time, management"
  },
  {
    "text": "There is no greater harm than that of time wasted.",
    "author": "Michelangelo",
    "source": "https://www.brainyquote.com/quotes/michelangelo_183580",
    "tags": "time, waste"
  },
  {
    "text": "Those who make the worse use of their time are the first to complain of its shortness",
    "author": "Jean de la Bruyere",
    "source": "https://www.brainyquote.com/quotes/jean_de_la_bruyere_104446",
    "tags": "time, complain"
  },
  {
    "text": "The price of anything is the amount of life you exchange for it.",
    "author": "Henry David Thoreau",
    "source": "https://www.brainyquote.com/quotes/henry_david_thoreau_106427",
    "tags": "price, priorities, life"
  },
  {
    "text": "Life isn't about finding yourself. Life is about creating yourself.",
    "author": "Bernard Shaw",
    "source": "https://www.goodreads.com/quotes/8727",
    "tags": "meaning, creativity"
  },
  {
    "text": "Knowing is not enough, we must apply. Willing is not enough, we must do.",
    "author": "Bruce Lee",
    "source": "https://www.goodreads.com/quotes/302319",
    "tags": "knowledge, action"
  }
]
```

Full file containing a _curated_ list of quotes:
[`quotes.json`](https://github.com/dwyl/quotes/blob/master/quotes.json)


### Parsing JSON Data

In order to parse JSON data in Elixir,
we need to import a module.

> This might seem tedious
if you have used other programming languages
such as Python or JavaScript
which have _built-in_ JSON parsers,
but it means we can use a _faster_ parser.
And since it all gets compiled
down to BEAM bytecode
without any effort from the developer,
this extra step is _automatic_.

There are several options to chose from
for parsing JSON data
on hex.pm
(_Elixir's package manager_) <br />
just search for the keyword "**json**":
https://hex.pm/packages?search=json

![hexpm-search-for-json](https://user-images.githubusercontent.com/194400/66706499-257f7f00-ed2b-11e9-94e9-ef4fd6c5202b.png)

In our case we are going to use
[**`jason`**](https://hex.pm/packages/jason)
because we have read the code and
[benchmarks](https://github.com/michalmuskala/jason#benchmarks)
and know that it's good.
[Phoenix](https://github.com/phoenixframework/phoenix/search?q=jason)
is moving to `jason` from `poison` in the next _major_ release.

For a `.json` file containing only a few thousand quotes
it probably does not matter which parser you use.
Elixir (_or the Erlang VM "BEAM"_)
will cache the decoded JSON map in memory
so any of the options will work.
Pick one and move on.

#### Add `jason` to dependencies in `mix.exs`

Open the `mix.exs` file in your editor
and locate the line that starts with
```elixir
defp deps do
```
In a new Elixir project the list of deps (_dependencies_) is empty.
Add the following line to the list:

```elixir
{:jason, "~> 1.1"}
```

For a snapshot of what the `mix.exs` file should look like at this point,
see:
[`quotes/mix.exs`](https://github.com/dwyl/quotes/blob/0af8108f4b0be8ae9ba58174979bca135945a04d/mix.exs#L24)

#### Run `mix deps.get`

With `jason` added to the list of `deps`,
you need to run the following command in your terminal:

```sh
mix deps.get
```

That will download the dependency from Hex.pm.


## Functions

As always, our first step is to create the user story issue
that describes what we are aiming to achieve:
[quotes/issues/4](https://github.com/dwyl/quotes/issues/4)

![functions-issue](https://user-images.githubusercontent.com/194400/66700544-47f0a880-ece9-11e9-8b65-2a0d31453700.png)

The functions we need to create are:

+ [ ] `parse_json` - open the `quotes.json` file and parse the contents.
+ [ ] `random` - get a random quote for any author or topic `Quotes.random()`
+ [ ] `tag` - get a quote by a specific tag e.g: `Quotes.tag("time")`
+ [ ] `author` - get a random quote by a specific author
e.g: `Quotes.author("Einstein")`

Let's start with the _first_ function,
opening the `quotes.json` file
and parsing it's content.

### `Quotes.parse_json`

The functionality for `parse_json` is quite simple:
+ open the `quotes.json` file
+ parse the data contained in the file
+ return the parsed data (a List of Maps)



#### Write the Docs _First_ for the `parse_json` Function

Open the `lib/quotes.ex` file in your editor
and locate the `hello` function:

```elixir
def hello do
  :world
end
```

> We are _keeping_
the `hello` function
as reference for writing our own functions
for the time being
because it's a known state
(_the tests pass_).
We will remove it -
and the corresponding tests -
once the `random` tests are passing.

Below the `hello` function,
add a new `@doc """` block with the following info:

```elixir
@doc """
parse_json returns a list of maps with quotes in the following form:
[
  %{
    "author" => "Albert Einstein",
    "text" => "Once we accept our limits, we go beyond them."
  },
  %{
    "author" => "Peter Drucker",
    "source" => "https://www.goodreads.com/quotes/784267",
    "tags" => "time, management",
    "text" => "Until we can manage time, we can manage nothing else."
  }
  %{...},
  ...
]

All quotes MUST have an `author` and `text` field.
Some quotes have `tags` and `source`, please help to expand/verify others.
"""
```

### Note on Documentation

The most often overlooked _feature_ in software is documentation.
People naively think that writing the code
is all that needs to be done in software development,
but that could not be further from the truth.
Documentation is at least _half_ of the project.
Even if you are the only person
who will "consume" the reuseable code,
it still pays to write _comprehensive_ documentation.
The small investment pays handsomely
when you return to the code in a week/month/year
you don't have to waste _hours_ trying to understand it.


> “_Good code is its own best documentation. As you’re about to add a comment,
ask yourself, ‘How can I improve the code so that this comment isn’t needed?'_”
~ Steve McConnell

This statement is _partially_ complete.
Code should be easy to read, that's _irrefutable_.
But any function that needs to be used
by more than one developer
can benefit from documentation
that speeds up understanding/using the code.

While can be tempting
to _think_ that code is "_self documenting_",
and that nobody _reads_ the docs,
this is a myopic and leads to huge amounts of wasted time.
Anyone who has worked as a software engineer
in a larger company where _some_ developers
think their code is "_self documenting_",
knows that newer developers don't _understand_ the code
they end up _re-implementing_ it
instead of reusing existing code.
This happens with _alarming_ frequency.
It's best to get into the habit of documenting _everything_
**`before`** you write the code.
Writing out what a function does before writing code
helps activate your brain to solve the problem _much faster_.

> "_Documentation is a love letter that you write to your future self_."
~ [Damian Conway](https://en.wikipedia.org/wiki/Damian_Conway)


#### Doctest?

> "_Incorrect documentation is often worse than no documentation._"
~ [Bertrand Meyer](https://en.wikipedia.org/wiki/Bertrand_Meyer)

Elixir has a superb
[Doctest](https://elixir-lang.org/getting-started/mix-otp/docs-tests-and-with.html)
feature that helps ensure documentation is kept current.
As we saw above, if a function changes and the docs are not updated,
the doctests will fail and thus prevent releasing the update.

Given that `parse_json` returns a large list of maps,
it's impractical to add a Doctest example to the `@doc` block;
the doctest would be _thousands_ of lines
and would need to be _manually_ updated
each time someone adds a quote.


#### Test `parse_json` Function

Open the `test/quotes_test.exs` file and add the following code:

```elixir
test "parse_json returns a list of maps containing quotes" do
  list = Quotes.parse_json()
  assert Enum.count(list) == Utils.count()

  # sample quote we know is in the list
  sample =  %{
    "author" => "Albert Einstein",
    "text" => "A person who never made a mistake never tried anything new."
  }

  # find the sample quote in the List of Maps:
  [found] = Enum.map(list, fn q ->
    if q["author"] == sample["author"] && q["text"] == sample["text"] do
      q
    end
  end)
  |> Enum.filter(& !is_nil(&1)) # filter out any nil values
  assert sample == found # sample quote was found in the list
end
```

Run the tests in your terminal:

```
mix test
```

You should expect to see it fail:

```sh
1) test parse_json returns a list of maps containing quotes (QuotesTest)
   test/quotes_test.exs:9
   ** (UndefinedFunctionError) function Quotes.parse_json/0 is undefined or private
   code: list = Quotes.parse_json()
   stacktrace:
     (quotes) Quotes.parse_json()
     test/quotes_test.exs:10: (test)

.

Finished in 0.04 seconds
1 doctest, 2 tests, 1 failure
```


#### Make the `parse_json` Test Pass

Add the following code to the `lib/quotes.ex`
file below the `@doc` definition
relevant to the `parse_json` function

```elixir
def parse_json do
  File.read!("quotes.json") |> Jason.decode!()
end
```

> Note: For the test to pass,
You will also need to create a file called `lib/utils.ex`
and add a `count` function.
See: [`lib/utils.ex`](https://github.com/dwyl/quotes/blob/38bd7c1b5ed12248a13ffa7f786919e3da5772ac/lib/utils.ex#L30-L39)


Re-run the tests:

```sh
mix test
```
You should expect to see the test pass:

```sh
...

Finished in 0.06 seconds
1 doctest, 2 tests, 0 failures

Randomized with seed 30116
```

For good measure,
let's write a test that ensures all quotes in `quotes.json`
have an `"author"` and `"text"` fields:

```elixir
test "all quotes have author and text property" do
  Quotes.parse_json()
  |> Enum.each(fn(q) ->
    assert Map.has_key?(q, "author")
    assert Map.has_key?(q, "text")
    assert String.length(q["author"]) > 2 # see: https://git.io/Je8CO
    assert String.length(q["text"]) > 10
  end)
end
```
This test might seem redundant,
but it ensures that people contributing **`new`**
quotes are not tempted to introduce incomplete data.
And having a test that runs on CI,
means that the build will fail if quotes are incomplete,
which makes the project more reliable.



### Document the `Quotes.random()` Function

Now that we have the `parse_json` helper function,
we can move on to the main course!

Open the `lib/quotes.ex` file (_if you don't already have it open_),
scroll to the bottom and
add the following `@doc` comment:

```elixir
@doc """
random returns a random quote.
e.g:
[
  %{
    "author" => "Peter Drucker",
    "source" => "https://www.goodreads.com/quotes/784267",
    "tags" => "time, management",
    "text" => "Until we can manage time, we can manage nothing else."
  }
]
"""
```



#### Testing `Quotes.random()`

Given that our principal function is ***`random`***
[nondeterministic](https://en.wikipedia.org/wiki/Nondeterministic_algorithm)
it can be _tempting_ to think that there is "no way to test" it.

In reality it's quite easy to test for randomness,
and we can even have a little _fun_ doing it!
We currently have 1565 quotes in `quotes.json`.
By running the `Quotes.random()` function
there is a 1 / 1565 x 100 = **0.063% chance**
of any given quote being returned.
That's great because it means
people _using_ the quotes
will be _highly unlikely_
to see the _same_ quote twice
in any given invocation.

But if the person were to keep track
of the random quotes they see,
the chance of seeing the same quote twice
increases with each invocation.
This is fairly intuitive,
with a finite set of quotes,
repetition is _inevitable_.
What is _less_ obvious
is how soon the repetition will occur.

Because of a neat feature
of compound probability
commonly referred to as the "_Birthday Paradox_",
we can calculate _exactly_ when the "random" quotes will be repeated.


> We aren't going to dive too deep into probability theory or math,
if you are curious about The
[Birthday Paradox](https://en.wikipedia.org/wiki/Birthday_problem),
read Kalid Azad's article (_and/or watch his video_):
https://betterexplained.com/articles/understanding-the-birthday-paradox



##### Birthday Paradox Formula

We can apply the birthday paradox formula
to determin how soon we will
see the same "random" quote twice:
(_replace the word people for quote and days for quotes_)

people (number of items we have already seen)     = 200
days (the "population" of available data)         = 1,565
pairs = (people * (people -1)) / 2                = 20,100
chance per pair = pairs / days                    = 12.84345047923
chance different = E^(-chance per pair) * 100     = 0.00026433844
chance of match = (100 - chance different)        = 99.99973566156

There is a **99.9997% probability**
that at a quote selected at random
will match a quote we have already seen
after the 200 random events.

In other words
if we execute `Quotes.random()` multiple times
and store the result in an List,
we are almost _certain_
to see a repeated quote
**`before`** we reach 200 invocations.

We can translate this into code
that tests the `Quotes.random` function.

Open `test/quotes_test.exs` file and add the following code:

```elixir
# This recursive function calls Quotes.random until a quote is repeated
def get_random_quote_until_collision(random_quotes_list) do
  random_quote = Quotes.random()
  if Enum.member?(random_quotes_list, random_quote) do
    random_quotes_list
  else
    get_random_quote_until_collision([random_quote | random_quotes_list])
  end
end

test "Quotes.random returns a random quote" do
  # execute Quotes.random and accoumlate until a collision occurs
  random_quotes_list = get_random_quote_until_collision([])
  # this is the birthday paradox at work! ;-)
  # IO.inspect Enum.count(random_quotes_list)
  assert Enum.count(random_quotes_list) < 200
end
```

If you save the file and run the tests:

```
mix test
```

You should expect to see it _fail_:

```sh
1) test Quotes.random returns a random quote (QuotesTest)
   test/quotes_test.exs:49
   ** (UndefinedFunctionError) function Quotes.random/0 is undefined or private
   code: random_quotes_list = get_random_quote_until_collision([])
   stacktrace:
     (quotes) Quotes.random()
     test/quotes_test.exs:41: QuotesTest.get_random_quote_until_collision/1
     test/quotes_test.exs:51: (test)

...

Finished in 0.1 seconds
1 doctest, 4 tests, 1 failure
```

The test fails
because we haven't yet implemented
the `Quotes.random` function.

Let's make the test pass by implementing the function!

#### Make the `Quotes.random` Test Pass

In the `lib/quotes.ex`,
add the following function definition
below the `@doc` block:
```elixir
def random do
  parse_json() |> Enum.random()
end
```

Yep, it's _that_ simple.
`Elixir` is _awesome_! 🎉

Re-run the tests:

```sh
mix test
```

They should now pass:

```sh
.....

Finished in 0.3 seconds
1 doctest, 4 tests, 0 failures
```

Now that our `Quotes.random` function is working as expected,
we can move on to _using_ the functionality to display quotes.

#### Tidy Up

Before continuing,
take a moment to tidy up the `lib/quotes.ex`
and `test/quotes_test.exs` files.

1. **Delete** the `@doc` comment and function definition
for the **`hello`** function. (_we no longer need it_)
2. Delete the corresponding test
for in the `hello` function in `test/quotes_test.exs`
Your files should now look like
[`lib/quotes.ex`](https://github.com/dwyl/quotes/blob/f69d551afffee6b15e8f874d6929d8338d92c420/lib/quotes.ex)
and
[`test/quotes_test.exs`](https://github.com/dwyl/quotes/blob/f69d551afffee6b15e8f874d6929d8338d92c420/test/quotes_test.exs)

Ensure that the remaining tests still pass (_as expected_):

```sh
mix test
```

There are fewer tests
(_because we removed one test and a doctest_)
but the remaining tests still pass:

```sh
Generated quotes app
...

Finished in 0.4 seconds
3 tests, 0 failures
```


#### Generate Docs

One of the biggest benefits of writing `@doc` comments up-front,
is that our functions are _already_ documented
and we don't have to _think_ about going back and doing it.
Elixir can automatically generate the documentation for us!

Add the following line to your `mix.exs` file in the `deps` section:

```elixir
{:ex_doc, "~> 0.21", only: :dev},
```

Then run the following command to download the `ex_doc` dependency.

```sh
mix deps.get
```

Now you can run `ex_docs` with the command:

```sh
mix docs
```

You will see output similar to this:

```sh
Compiling 1 file (.ex)
Docs successfully generated.
View them at "doc/index.html".
```


In your terminal type the following command:

```sh
open doc/index.html
```

That will open the `doc/index.html` file
in your default web browser.
e.g:

![quotes-docs](https://user-images.githubusercontent.com/194400/66772514-cea5b100-eeb4-11e9-9f79-244847381dcf.png)



## 2. Reuse Code _Without_ Publishing to Hex.pm




## 3. Publish Package to Hex.pm

### What is Hex.pm?

Hex.pm is the package manager for the `Elixir` (and `Erlang`) ecosystem.
It allows you to publish packages free of charge
and share them with your other projects
and the community.

![hex.pm-home-page](https://user-images.githubusercontent.com/194400/65838440-f4e72080-e2fa-11e9-82d4-821187461804.png)

![hex.pm-no-owned-packages](https://user-images.githubusercontent.com/194400/65838879-8c4e7280-e2ff-11e9-8357-c939e3fde78a.png)

Authenticate with hex.pm in the terminal of your `localhost`:
```
mix hex.user auth
```

Publish the package:
```
mix hex.publish
```

```sh
Building quotes 1.0.0
  Dependencies:
    jason ~> 1.1 (app: jason)
  App: quotes
  Name: quotes
  Files:
    lib
    lib/index.js
    lib/quotes.ex
    lib/utils.ex
    .formatter.exs
    mix.exs
    README.md
    LICENSE
  Version: 1.0.0
  Build tools: mix
  Description: a collection of inspiring quotes and methods to return them.
  Licenses: GNU GPL v2.0
  Links:
    GitHub: https://github.com/dwyl/quotes
  Elixir: ~> 1.9
Before publishing, please read the Code of Conduct: https://hex.pm/policies/codeofconduct

Publishing package to public repository hexpm.

Proceed? [Yn]
```

Type `y` in your terminal and hit the `[Enter]` key. <br />
You will see the following output to confirm the docs have been built:

```
Building docs...
Compiling 2 files (.ex)
Generated quotes app
Docs successfully generated.
View them at "doc/index.html".

Local password:
```

Enter the password you defined
as part of runnig `mix hex.user auth` above.


If the package name is available (_which we knew it was_),
then it will be successfully published:

```
Publishing package...
[#########################] 100%
Package published to https://hex.pm/packages/quotes/1.0.0 (7147b94fa97ee739d8b8a324ed334f7f50566c9ed8632bf07036c31a50bf9c64)
Publishing docs...
[#########################] 100%
Docs published to https://hexdocs.pm/quotes/1.0.0
```

See: https://hex.pm/packages/quotes

![quotes-hex.pm-published](https://user-images.githubusercontent.com/194400/66844523-54ce0000-ef66-11e9-8301-499b8cb14d71.png)

Docs: https://hexdocs.pm/quotes/Quotes.html

![quotes-hexdocs](https://user-images.githubusercontent.com/194400/66844615-7fb85400-ef66-11e9-8cee-e79c210e177b.png)



## 4. Use the Package in a New Project



## 4.a Basic Elixir Web Service _Without_ Phoenix


## 4.b Phoenix Web Service




### Q: If Phoenix is more code, why would I want to use it?

**Answer**: Phoenix is great way to organise your project,
it gives you many advanced features like a database interface,
security and monitoring.


## Recap

In this brief tutorial we learned how to write reusable Elixir code.
We reused the our Quotes


## _Modify_ or _Extend_?

This example could easily be modified or extended
for any purpose.

http://quotes.rest

![quotes-rest-api](https://user-images.githubusercontent.com/194400/65838802-d125d980-e2fe-11e9-93a4-12026b05932e.png)


## Transfer a Package to Another User/Org

https://hex.pm/docs/faq#can-i-transfer-ownership-of-a-package

## References and Further Reading

+ Good background on code reuse: https://en.wikipedia.org/wiki/Code_reuse
+ Landscape photos: https://unsplash.com/s/photos/landscape
+ Generating Random Numbers in Erlang and Elixir:
https://hashrocket.com/blog/posts/the-adventures-of-generating-random-numbers-in-erlang-and-elixir
+ TIL: Margaret Hamilton,
director of the Software Engineering Division
of the MIT Instrumentation Laboratory,
which developed on-board flight software for NASA's Apollo space program.
(_one of the people who coined the term "software engineering"_)
https://en.wikipedia.org/wiki/Margaret_Hamilton_(software_engineer)


## Notes



## Example Use Case: Momentum Dashboard


[Momentum](https://chrome.google.com/webstore/detail/momentum/laookkfknpbbblfpciffpaejjkokdgca) is an example
of where inspiring quotes are used. https://momentumdash.com

![momentumdash-homepage](https://user-images.githubusercontent.com/194400/66111636-2db81b80-e5c1-11e9-92b8-c2836ea7b48d.png)

<div align="center">
  <a href="https://momentumdash.com">
    <img src="https://user-images.githubusercontent.com/194400/66114469-cd2bdd00-e5c6-11e9-9465-af9a032c700c.png" "momentum dashboard example">
  </a>
</div>

> Though as far as inspiring quotes go,
"_Yesterday you said tomorrow_"
is about as inspiring a direct link to the Netflix homepage. 🙄 <br />
(_we can do so much better than this!_)


Even if you feel that
having a person homepage/dashboard -
that reminds you to stay focussed - is not for you,
you can at least acknowledge that there is a _huge_ "market" for it:

<div align="center">
  <a href="https://chrome.google.com/webstore/detail/momentum/laookkfknpbbblfpciffpaejjkokdgca">
    <img src="https://user-images.githubusercontent.com/194400/66114356-93f36d00-e5c6-11e9-9961-f4439760c955.png" "3.4 Million Chrome Users!">
  </a>
</div>



## Motivational Quotes are _Lame_

![inspirational-quote-tony-robbins](https://user-images.githubusercontent.com/194400/65891570-a68a5e00-e39c-11e9-8cfd-d6fcaeea242f.png)


If you are sceptical of motivational quotes,
or "self-help" in general,
remember that words have motivated many masses.

<!--

[![image](https://user-images.githubusercontent.com/194400/66122384-724eb180-e5d7-11e9-8e37-726191e32421.png)](https://youtu.be/TME0xubdHQc "they may take our lives, but they'll never take our freedom!")

-->


> “_“Of course motivation is not permanent.
But then, neither is bathing; <br />
but it is something you should do on a regular basis_.”
~ [Zig Ziglar](https://www.goodreads.com/author/quotes/50316.Zig_Ziglar)

> “_I am not young enough to know everything_.”
~ [Oscar Wilde](https://www.goodreads.com/author/quotes/3565.Oscar_Wilde)

You might not think that motivational quotes _work_ on _you_
in the same way that _most_ people
feel they aren't _influenced_ to advertising.



Examples of popular quotes
(_as upvoted or "liked" by the users of goodreads.com_):
[goodreads.com/quotes](https://www.goodreads.com/quotes)


![inspirational-quotes-motivating-helpful](https://user-images.githubusercontent.com/194400/65878472-0f1a1080-e386-11e9-92b5-8337c581d825.png)


![words-dont-have-power](https://user-images.githubusercontent.com/194400/65902305-03dcda00-e3b2-11e9-9574-5c0a01f3bd21.png)


[![trump-make-america-great-again](https://user-images.githubusercontent.com/194400/66102197-66e49180-e5a9-11e9-87cf-05d3416d7120.png)](https://en.wikipedia.org/wiki/Make_America_Great_Again "Make America Great Again")