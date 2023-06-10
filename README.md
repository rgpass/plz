# `plz` CLI

`plz` is a CLI tool to translate natural language into bash commands. It uses your own API key and does not hit any other services, keep your key secure.

## Example

```bash
$ plz grep all files that contain the string "plz"
```

```text
grep -r "plz" /Users/gpass/scripts/plz

Press Return to continue, or e for an explanation: e
This command searches for the string "plz" recursively in all files under the directory /Users/gpass/scripts/plz. The -r flag specifies recursive search.

Press Return to continue, or n to cancel:

Executing command...

/Users/gpass/scripts/plz/plz:  handle_error "no command given" "Sample usage: plz list all files in the current directory"
/Users/gpass/scripts/plz/README.md:# `plz` CLI
/Users/gpass/scripts/plz/README.md:`plz` is a CLI tool to translate natural language into bash commands. It uses your own API key and does not hit any other services, keep your key secure.
/Users/gpass/scripts/plz/README.md:$ plz grep all files that contain the string: plz
/Users/gpass/scripts/plz/README.md:grep -r "plz" /Users/gpass/scripts
/Users/gpass/scripts/plz/README.md:This command searches for the string "plz" recursively in all files under the directory /Users/gpass/scripts. The -r flag specifies recursive search.
/Users/gpass/scripts/plz/README.md:/Users/gpass/scripts/plz/plz:  handle_error "no command given" "Sample usage: plz list all files in the current directory"
/Users/gpass/scripts/plz/README.md:/Users/gpass/scripts/plz/README.md:# `plz` CLI
/Users/gpass/scripts/plz/README.md:/Users/gpass/scripts/plz/README.md:`plz` is a CLI tool to translate natural language into bash commands. It uses your own API key and does not hit any other services, keep your key secure.
/Users/gpass/scripts/plz/README.md:/Users/gpass/scripts/plz/README.md:$ plz list all directories and their direct descendant directories
/Users/gpass/scripts/plz/README.md:/Users/gpass/scripts/plz/README.md:- Clone this repo and `cd plz`
/Users/gpass/scripts/plz/README.md:/Users/gpass/scripts/plz/README.md:- Make `plz` executable via `chmod +x plz`
/Users/gpass/scripts/plz/README.md:/Users/gpass/scripts/plz/.git/config:   url = https://github.com/rgpass/plz.git
/Users/gpass/scripts/plz/README.md:Binary file /Users/gpass/scripts/plz/.git/index matches
/Users/gpass/scripts/plz/README.md:- Clone this repo and `cd plz`
/Users/gpass/scripts/plz/README.md:- Make `plz` executable via `chmod +x plz`
/Users/gpass/scripts/plz/.git/config:   url = https://github.com/rgpass/plz.git
Binary file /Users/gpass/scripts/plz/.git/index matches
```

## Installation

### Steps

- Create an OpenAI API key
- Clone this repo and `cd plz`
- Copy the `.env.example` via `cp .env.example .env`
- Add the OpenAI API key to `.env`
- Make `plz` executable via `chmod +x plz`
- Add this directoy to your `$PATH`
  - Print the working directory via `pwd`
  - Open `~/.profile` (or `~/.zshrc` if you're using zsh)
  - At the bottom of that file, add `export PATH=<output from pwd>:$PATH`
  - Source the file via `source ~/.profile` or open a new Terminal tab
- Install `jq` binary via `brew install jq` (assuming you have Homebrew)

## Warning

The commands are potentially destructive. Ask for an explanation to confirm it's what you want.

## Inspiration

This project is heavily influenced by [`pls`](https://github.com/MxDkl/pls). The main differences are:

- Adding an explanation to aid in learning
- Coloring improvements for readability

## Future versions

- Apply tree of thought prompting
