# CodecovExample

## Adding code coverage to your apps

So first things first, what is code coverage and why would you want to add it to
your application?

Simply put, code coverage is a way of checking that the functions you have
written are tested. A code coverage tool will run the tests and check to see if
there are any lines of code that are not checked (covered) by a test. Hence the
name.

They can be a very helpful tool when you are trying to test your applications as
they can help to highlight parts of code that are not tested and may contain
errors. They also may highlight the fact that some of the code that was written
is not even needed, for example a clause in a function that can never be
reached.

Now that that's out of the way let's set up a simple mix project and add code
coverage to it.

## Setting up our new mix project

Open your terminal and `cd` to the directory that you would like to create your
new project in.

Once there, run the `mix new` command with the name of your app. Mine is called
codecov_example so the command would be...
```sh
mix new codecov_example
* creating README.md
* creating .formatter.exs
* creating .gitignore
* creating mix.exs
* creating config
* creating config/config.exs
* creating lib
* creating lib/codecov_example.ex
* creating test
* creating test/test_helper.exs
* creating test/codecov_example_test.exs

Your Mix project was created successfully.
You can use "mix" to compile it, test it, and more:

    cd codecov_example
    mix test

Run "mix help" for more commands.
```

Now let's follow the on screen instructions and `cd` into the directory.

Something I personally think is pretty cool is that this app will already have
a function and a tests for that function. We can run the tests with `mix test`
(as our terminal said above)...

```sh
mix test
..

Finished in 0.03 seconds
1 doctest, 1 test, 0 failures

Randomized with seed 484163
```

You can see that we have `1 doctest` and `1 test` (1 "regular" test) with 0
failures.

We are not going to cover doctests in this example but if you would like to
learn more about them then check out the following link,
https://elixir-lang.org/getting-started/mix-otp/docs-tests-and-with.html#doctests.

Now let's go and check out the code.

In a text editor of your choice, open up the `lib/codecov_example.ex` (your
name will vary if you didn't call your project the same thing as me but the file
will match your project name).

You should see something that looks similar to this...
```elixir
defmodule CodecovExample do
  @moduledoc """
  Documentation for CodecovExample.
  """

  @doc """
  Hello world.

  ## Examples

      iex> CodecovExample.hello()
      :world

  """
  def hello do
    :world
  end
end
```

Let's delete all the code with the exception of the first and last lines.

Now, let's add our own functions to this file. Copy and paste the following
functions into your module...
```elixir
def add_one(n), do: 1 + n

def add_two(n), do: 2 + n

def add_three(n), do: 3 + n
```

You should now have something that looks like this...
```elixir
defmodule CodecovExample do

  def add_one(n), do: 1 + n

  def add_two(n), do: 2 + n

  def add_three(n), do: 3 + n
end
```

As you can see, these are fairly straightforward functions so I won't explain
them too much. They all just do what their name says they do.

Now let's go and add tests for these. Open `test/codecov_example_test.exs`.

Delete the default test for the `hello/1` function (as we deleted this function
earlier) and replace it with the following...

```elixir
  describe "testing the add functions in CodecovExample" do
    test "adds one" do
      assert CodecovExample.add_one(10) == 11
    end

    test "adds two" do
      assert CodecovExample.add_two(10) == 12
    end
  end
```

As you can see, this has added functions that test our `add_one/1` and
`add_two/2` functions.

Let's run these tests and see if they pass. In the terminal run the `mix test`
command again...
```sh
mix test
Compiling 1 file (.ex)
..

Finished in 0.03 seconds
2 tests, 0 failures
```

As you can see our tests are passing and all is looking good. However, as you
have probably seen, we do not have a test for our add three function. Now, in
our example it's fairly easy to do an eyeball test and see that we are missing
a test, but imagine you are in a project with 100 functions all spread out over
different modules. The eyeball test isn't so reliable anymore.

That's where code coverage tools can come in handy. So let's add one to our
app.

To do this open your `mix.exs` file and add the following line to your `list` of
`deps`...

```elixir
{:excoveralls, "~> 0.10", only: :test}
```

Next, in the terminal, run the command `mix deps.get`. This will add
`excoveralls` as a dependency to our project. The `only: :test` part of the
command is to say that we will only be using this dependency in our test
environment. You should see this in your terminal:

```sh
mix deps.get
Resolving Hex dependencies...
Dependency resolution completed:
New:
  certifi 2.4.2
  excoveralls 0.10.4
  hackney 1.15.0
  idna 6.0.0
  jason 1.1.2
  metrics 1.0.1
  mimerl 1.0.2
  parse_trans 3.3.0
  ssl_verify_fun 1.1.4
  unicode_util_compat 0.4.1
* Getting excoveralls (Hex package)
* Getting hackney (Hex package)
* Getting jason (Hex package)
* Getting certifi (Hex package)
* Getting idna (Hex package)
* Getting metrics (Hex package)
* Getting mimerl (Hex package)
* Getting ssl_verify_fun (Hex package)
* Getting unicode_util_compat (Hex package)
* Getting parse_trans (Hex package)
```

Now, in the same file, add the following lines to your `project list`...
```elixir
test_coverage: [tool: ExCoveralls],
preferred_cli_env: [coveralls: :test]
```

The `test_coverage: [tool: ExCoveralls]` line, tells our application which tool
to use for test coverage.

The `preferred_cli_env: [coveralls: :test]` line is a helper for us. It allows
us to run `coveralls` commands in the terminal without having to prefix them
with `MIX_ENV=test`.

For more info on these commands, see the
[excoveralls readme](https://github.com/parroty/excoveralls#mixexs).

You should have a file that looks something like this...
```elixir
defmodule CodecovExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :codecov_example,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test]
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
      {:excoveralls, "~> 0.10", only: :test}
    ]
  end
end
```

If you have followed the steps above you should now be able to run
`mix coveralls` in your terminal...
```sh
mix coveralls
..

Finished in 0.03 seconds
2 tests, 0 failures

Randomized with seed 631880
----------------
COV    FILE                                        LINES RELEVANT   MISSED
 66.7% lib/codecov_example.ex                          8        3        1
[TOTAL]  66.7%
----------------
```

As you can see it ran our two tests like the the `mix test` command did earlier
but it also shows a break down of our code, and what was covered by our tests.

```sh
66.7% lib/codecov_example.ex                          8        3        1
```

As you can see, our `lib/codecov_example.ex` file is only 66.7% covered. There
are more detailed commands that we can run in order to find out which lines are
covered and which are missing but if you are interested in looking into those
then check out the [excoveralls readme](https://github.com/parroty/excoveralls).

We know now that we are missing a test for one of our functions (we already knew
but humour me ;).)

When we compare our tests to our module, we can see that we are missing a test
for our `add_three/1` function. Let's fix that. Add the following test to your
test file...
```elixir
test "adds three" do
  assert CodecovExample.add_three(10) == 13
end
```

Now run the `mix coveralls` command again...
```sh
mix coveralls
...

Finished in 0.03 seconds
3 tests, 0 failures

Randomized with seed 367173
----------------
COV    FILE                                        LINES RELEVANT   MISSED
100.0% lib/codecov_example.ex                          8        3        0
[TOTAL] 100.0%
----------------
```

You can now see that we have 100% code coverage 🎉🎉🎉🎉🎉🎉🎉

We have now shown that our tests test every line of our code.

## Badges

Now that we have covered all the code let's show this off to the world by adding
a badge to our application.

We are going to get [travis-ci](https://travis-ci.org/) to check our tests
online for us when we commit our code to github (this section assumes you are
going to be pushing your code, so if you are not planning to then feel free to
skip this bit).

In order to get travis to run our tests we need to create a `.travis.yml` file.
I am not going to go into any detail on the travis-ci steps as there in an
amazing readme that will teach you all about it
[here](https://github.com/dwyl/learn-travis). If you don't already have an
account with travis, then check out the travis readme.

For the online coverage tool we will be using codecov (the app name I chose may
have given this away 😉). Go to https://codecov.io/ and log in/sign up with your
github account (it really is that simple).

Now that you are set up create a file called `.travis.yml` in the root of your
project and add the following code...
```yml
language: elixir
elixir:
  - 1.8
env:
  - MIX_ENV=test
script:
  - mix coveralls.json
after_success:
  - bash <(curl -s https://codecov.io/bash)
```

This will handle the travis set up and also tells travis which commands to run.
You can see that we have told travis to run `mix coveralls.json`. This is one of
the extra commands that excoveralls has that I mentioned earlier. This command
generates a folder and file in the root of your app. This is what codecov will
use to check your overall coverage and create a badge you can show off to the
world.

The file will be called `cover/excoveralls.json`. By default, new elixir apps
ignore the `cover` directory. This is good for us as we do not need to push this
file to github.

All that's left for us to do is add the badges to our readme 👍

Open your readme and add links SIMILAR to the ones below, to the top of your
readme file (but underneath the main title)...

![Build Status](https://travis-ci.org/dwyl/learn-elixir.svg?branch=master)
![codecov](https://codecov.io/gh/dwyl/learn-elixir/branch/master/graph/badge.svg)

The format of the links are as links that display the badge images are as
follows...

#### Travis build badge
https://travis-ci.org/ + org_name + / + repo_name + .svg?branch=master

#### Codecov badge
https://codecov.io/gh/ + org_name + / + repo_name + /branch/master/graph/badge.svg

Now all that's left is to push your code to github and get it merged into
master 😁.
