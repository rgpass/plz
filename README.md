# `plz` CLI

`plz` is a CLI tool to translate natural language into bash commands. It uses your own API key and does not hit any other services, keep your key secure.

## Examples

```bash
plz list all directories and their direct descendat directories
```

## Installation

### Steps

- Create an OpenAI API key
- Clone this repo and `cd plz`
- Add this key to the `plz` file
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

- It applies [tree of thought prompting]() to confirm the prompt is accurate
- Adding an explanation to aid in learning
