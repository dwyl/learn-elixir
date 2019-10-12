# Reusing Elixir - How to Use and Publish Code on Hex.pm 📦

Once you understand basic Elixir syntax
you may be wondering how to re-use
both your own code across projects <br />
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



# Why?

> "_Good programmers
know what to write.
Great ones know what
to rewrite_ (_and **reuse**_).". <br />
~ Eric S. Raymond (The Cathedral and the Bazaar)

The biggest advantages of code reuse are:
+ Independently tested small pieces of code
that do only one thing.
([Curly's Law](https://blog.codinghorror.com/curlys-law-do-one-thing))
+ Work can be subdivided among people/teams with clear responsibilities. <br />
Or if you are solo developer,
having small chunks of code helps you bitesize your work
so it's more manageable.
+ Leverage _other_ people's code
to reduce your own efforts
and ship faster.

> "_If I have seen further than others, it is by standing upon the shoulders of giants._" ~ Isaac Newton

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

```


There are _many_ uses for quotes.
If you're having trouble thinking of how/why this is useful.
Imagine a browser home page
that displays a different inspiring/motivating/uplifting quote
each time you view it
to remind you
to stay focussed/motivated
on your goal for the day.<sup>[1](#example-use-case-momentum-dashboard)</sup>


# How?

This is a step-by-step example of creating an Elixir package from scratch.


## 1. Write _Useable_ Code

> "_Before software can be reusable,
it first has to be usable._"
~ Ralph Johnson


### 1.1 Create a GitHub New Repository

Our _first step_ is always to write useable code.
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
[commit/14e7a08](https://github.com/nelsonic/quotes/commit/14e7a084360687510f9bb18925f022065d797ab9)


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


### Get Quotes!

Now that we have the basics of an Elixir project,
our next task is to create (_or find_) a database of quotes.

We could _manually_ compile our list of quotes
by combing through a few popular quotes websites.
+ Wikiquote: https://en.wikiquote.org/wiki/Motivation
+ Brainyquote: https://www.brainyquote.com/topics/motivational-quotes
+ Goodreads: https://www.goodreads.com/quotes

_Or_ we can supply our favourite search engine
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

Full file:
[`quotes.json`](https://github.com/nelsonic/quotes/blob/master/quotes.json)


### Parsing JSON Data

I order to parse JSON data in Elixir,
we need a dedicated module.

> This might seem tedious
if you have used other programming languages
such as Python or JavaScript
which have _built-in_ JSON parsers,
but it means we can use a _faster_ parser.







### Documentation

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

While it's often tempting to _think_ that code is "_self documenting_",
and that nobody _reads_ the docs, this is a myopic


#### Doctest




> "_Incorrect documentation is often worse than no documentation._"
~ [Bertrand Meyer](https://en.wikipedia.org/wiki/Bertrand_Meyer)

Elixir has a superb
[Doctest](https://elixir-lang.org/getting-started/mix-otp/docs-tests-and-with.html)
feature that helps ensure documentation is kept current.
If a function changes and the docs are not updated,
the doctests will fail and thus prevent releasing the update.



### Testing

Given that our principal ...




### Which JSON Parsing Dependency?

According to the
[benchmarks](https://github.com/michalmuskala/jason#benchmarks),
it's faster.
[Phoenix](https://github.com/phoenixframework/phoenix/search?q=jason)




## 2. Reuse Code _Without_ Publishing to Hex.pm




## 3. Publish Package to Hex.pm



### What is Hex.pm?



![hex.pm-home-page](https://user-images.githubusercontent.com/194400/65838440-f4e72080-e2fa-11e9-82d4-821187461804.png)


![hex.pm-no-owned-packages](https://user-images.githubusercontent.com/194400/65838879-8c4e7280-e2ff-11e9-8357-c939e3fde78a.png)


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



## Motivational Quotes are Lame

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
