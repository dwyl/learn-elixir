<div align="center">

# `Mac` with `Apple Silicon` Installation Instructions 💻

</div>

If you have trouble installing `Elixir`
on your `Mac` 
with an `M1` (and `M2`, `M3`, etc.) processor.
using `brew`,
these are the detailed steps you need!

# `Homebrew`

If you don't already have `Homebrew` on your Mac,
get it at: 
[brew.sh](https://brew.sh/)


## Install

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


## Dependencies

```
brew install autoconf automake coreutils curl fop libtool libxslt libyaml readline unixodbc unzip
```

In case you're wondering what these are:

+ `autoconf` - configuration tool
  https://en.wikipedia.org/wiki/Autoconf
+ `automake` - streamlines compilation
  https://en.wikipedia.org/wiki/Automake
+ `coreutils` - basic primitives for unix systems:
  https://en.wikipedia.org/wiki/GNU_Core_Utilities
+ `curl` - fetching remote data
  https://en.wikipedia.org/wiki/CURL
+ `fop` - to generate `pdf` docs: https://xmlgraphics.apache.org/fop 
  Install to avoid errors:
  https://stackoverflow.com/questions/64281355/fop-is-missing
+ `libtool` - for compiling on different Operating Systems ...
  https://en.wikipedia.org/wiki/GNU_Libtool
+ `libxslt` - `XSLT` implementation for parsing `XML`
  https://en.wikipedia.org/wiki/Libxslt
+ `libyaml` - `YAML` parser and emitter library: 
  https://pyyaml.org/wiki/LibYAML
+ `readline` - in-line editing and history capabilities for interactive programs with a command-line interface
  https://en.wikipedia.org/wiki/GNU_Readline
+ `unixodbc` - implements the [`ODBC` API](https://en.wikipedia.org/wiki/Open_Database_Connectivity)
  https://en.wikipedia.org/wiki/UnixODBC
+ `unzip` - unzip files: 
  https://en.wikipedia.org/wiki/ZIP_(file_format)


## OpenSSL

The _reason_ we originally needed these more detailed installation instructions ...
`Erlang` (on `Mac`) is not compatible with `openssl` higher than `1.1`.

```sh
brew install openssl@1.1
```

```sh
brew unlink openssl@2
```

```sh
brew unlink openssl@3
```

```sh
brew link openssl@1.1
```



## `asdf`

`asdf` is a **version manager** that lets you
easily run multiple versions of `Elixir`, `Node.js`, `Python`, etc. 
[github.com/asdf-vm/asdf](https://github.com/asdf-vm/asdf)


```sh
brew install asdf
```

Ref: 
[asdf-vm.com/guide/getting-started](https://asdf-vm.com/guide/getting-started.html)


## Install `Erlang` using `asdf`


```sh
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
```

Followed by:

```sh
asdf install erlang 26.2
```

Ref: 
[github.com/asdf-vm/asdf-erlang](https://github.com/asdf-vm/asdf-erlang)


## Install `Elixir` using `asdf`

```sh
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
```

Ref:
[github.com/asdf-vm/asdf-elixir](https://github.com/asdf-vm/asdf-elixir)

Then:

```sh
asdf install elixir 1.16.0-otp-25
```





## Credits

Credit for this guide goes to 
[`@mdapper`](https://github.com/mdapper)
for their post:
[devheroes.io/en/erlang-elixir-macos-m1](https://devheroes.io/en/erlang-elixir-macos-m1/)
at the time of writing 
it was 18 months old
and required updating
but is still a great starting point.
