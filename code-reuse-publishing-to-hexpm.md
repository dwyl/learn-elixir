# Reusing Elixir Code - How to Publish Packages to Hex.pm

Once you understand the basic syntax of Elixir
you may be wondering how to re-use
both your own code across projects
and other people's code in your projects.

# Why?

> "Good programmers
know what to write.
Great ones know what
to rewrite (and reuse).". <br />
~ Eric S. Raymond - "The Cathedral and the Bazaar"

> "_Code reuse is the Holy Grail of Software Engineering._"
~ 

The biggest advantages of code reuse are:
+ Independently tested small pieces of code
that do only one thing.
([Curly's Law](https://blog.codinghorror.com/curlys-law-do-one-thing))
+ Work can be subdivided into teams with clear responsibilities.
Or if you are solo developer,
having small chunks of code helps you bitesize your work
so you can check things off a bigger list faster.
+ You can use other people's code to reduce your own efforts and ship faster.


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
Quotes are usually an expression of wisdom in a concise form.



In our example we will be focussing on
a subset of quotes; the motivational kind. e.g:

![inspirational-quote-tony-robbins](https://user-images.githubusercontent.com/194400/65891570-a68a5e00-e39c-11e9-8cfd-d6fcaeea242f.png)


If you are sceptical of motivational quotes,
or "self-help" in general,
remember that words have motivated many masses.

> “_I am not young enough to know everything_.”
~ [Oscar Wilde]()

You might not think that motivational quotes _work_ on _you_
in the same way that _most_ people
feel they aren't _influenced_ to advertising.





Examples of popular quotes
(_as upvoted or "liked" by the users of goodreads.com_):
[goodreads.com/quotes](https://www.goodreads.com/quotes)


![inspirational-quotes-motivating-helpful](https://user-images.githubusercontent.com/194400/65878472-0f1a1080-e386-11e9-92b5-8337c581d825.png)



Our objective with this code is
to create an Elixir module that returns
a random quote when `Quotes.random()` is invoked.

# How?

> “First, solve the problem. Then, write the code.” ~ John Johnson

Imagine you have a personal home defined for your web browser
that displays a different inspiring/motivating/uplifting quote
each time you visit it to remind you



The problem we are solving in this example
is creating a module,
that when invoked
returns a random
quote (_e.g a "quote of the day"_).
For example




## 1. Write Useable Code

> "_Before software can be reusable,
it first has to be usable._"
~ Ralph Johnson


Our _first step_ is always to write reuseable code.
If you are rewriting the same code
("_reinventing the wheel_")
in each new project
you have not understood a
basic principal of software engineering:
reuse code.


The more code you are able to reuse,
the more creative and interesting work you can do.



### Documentation: Doctest

https://elixir-lang.org/getting-started/mix-otp/docs-tests-and-with.html


> "_Incorrect documentation is often worse than no documentation._"
~ [Bertrand Meyer](https://en.wikipedia.org/wiki/Bertrand_Meyer)

### Testing

Given that our principal


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


## References and Further Reading

+ Good background on code reuse: https://en.wikipedia.org/wiki/Code_reuse
