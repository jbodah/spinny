# Spinny

a lightweight, unopinionated ruby application pre-loader

## Description

Spinny is influenced by projects like Spring and Spin and tries to make your workflow more efficient.
It differs from those projects in the sense that it is designed to be lighter and does not try to
create special cases for certain technologies like Rails or particular test runners.
Small, light, and modular is the name of the game.

## How It Works

Spinny works using a client-server model.
The server will pre-load some code that you give it and then start listening on a TCP port.
When it receives a connection it will fork off new process and run the code passed in the TCP message.

## Installation

```sh
gem install spinny_rb
```

## Usage

First, you'll need to start your server.
In this example, we spin up a `Spinny::Server` using the `spinny-serve` executable.

```sh
# Add the 'test' directory to the $LOAD_PATH and pre-load 'test_helper'
spinny-serve -Itest test_helper

# Pre-loading your typical Rails app
spinny-serve config/environment
```

Now we need a client to push code to our running server.
Spinny comes with several clients out of the box:

* `Spinny::InteractiveClient` is a REPL that will push arbitrary code to the server
* `Spinny::LoadClient` takes a bunch of files and pushes them to the server to be loaded (e.g. running tests)
* `Spinny::ListenClient` is inspired by Guard. It takes a bunch of filepaths and listens for OS file change events and then loads the changed files on the server

All of these can be used by loading the respective client into an IRB shell.
Spinny also provides some executables to make it easier to work with common use cases.

### spinny-push

`spinny-push` will read a list of filenames from ARGV or STDIN and use `Spinny::LoadClient` to push them to the server:

```sh
# Read from ARGV
spinny-push file_one.rb file_two.rb

# Read from STDIN
ls test/*_test.rb | spinny-push
```

### spinny-listen

`spinny-listen` will read a list of directories from ARGV or STDIN and use `Spinny::ListenClient` to watch for file changes and then will push them to the server via `Spinny::LoadClient`

```sh
spinny-listen test
```

### spinny-guard

`spinny-guard` gives you [guard](https://github.com/guard/guard)-like functionality. This spins up `Spinny::ListenClient` and a `Spinny::Server` for you in one convenient command

```sh
spinny-guard
```

### spinny-stop

Finally, there is `spinny-stop` for killing all of your Spinny processes:

```sh
spinny-stop
```

## TODO

* Add regexp for spinny-listen
* Add spinny-reload for reloading the server
* Add spinny-reload for listening and reloading the server when certain things happen
* Add README docs for doing typical spring stuff (rails s, rails c, rake)
