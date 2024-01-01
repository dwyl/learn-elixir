# `Mac` with `Apple Silicon` Installation Instructions

These are the detailed steps for installing
`Elixir` and `Erlang` on a `Mac` 
with an `M1` (and `M2`, `M3`, etc.) processor.

# Homebrew

## Additional Dependencies

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


## Credits

Credit for this guide goes to 
[`@mdapper`](https://github.com/mdapper)
for their post:
[devheroes.io/en/erlang-elixir-macos-m1](https://devheroes.io/en/erlang-elixir-macos-m1/)
at the time of writing 
it was 18 months old
and required updating
but is still a great starting point.
