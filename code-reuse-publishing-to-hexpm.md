# Reusing Elixir Code - How to Publish Packages to Hex.pm

Once you understand the basic syntax of Elixir
you may be wondering how to re-use
both your own code across projects
and other people's code in your projects.


# What?

In this example we are going to build a simple Elixir package
that returns a **random inspiring quote**
when the main function is invoked. <br />
Along the way we will demonstrate how to:
1. Write, document and test a basic package.  
2. Reuse code _without_ publishing to Hex.pm.
3. Publish a package to Hex.pm
4. Use the code it in a different project.

## Quotes?

A quotation or quote
is the repetition of someone else's statement or thoughts.

Examples of popular quotes
(_as upvoted or "liked" by the users of goodreads.com_):
[goodreads.com/quotes](https://www.goodreads.com/quotes)


Our objective with this code is
to create an Elixir module that returns
a random quote when `Quotes.random()` is invoked.

# How?


## 1. Write Reuseable Code

Our _first step_ is always to write reuseable code.
If you are rewriting the same code
("_reinventing the wheel_")
in each new project
you have not understood a
basic principal of software engineering:
reuse code.

> "Good programmers know what to write.
Great ones know what to reuse". <br />
~ Eric S. Raymond - "The Cathedral and the Bazaar"


### Documentation: Doctest

https://elixir-lang.org/getting-started/mix-otp/docs-tests-and-with.html


> "_Incorrect documentation is often worse than no documentation._"
~ [Bertrand Meyer](https://en.wikipedia.org/wiki/Bertrand_Meyer)

### Testing


## 2. Reuse Code _Without_ Publishing to Hex.pm


## 3. Publish Package to Hex.pm

### What is Hex.pm?



![hex.pm-home-page](https://user-images.githubusercontent.com/194400/65838440-f4e72080-e2fa-11e9-82d4-821187461804.png)


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


## References and Further Reading
