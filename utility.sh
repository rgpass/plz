#!/bin/bash

abort() {
  change_color "red"
  echo "Aborted."

  # Reset to original state and exit
  set +f
  exit 1
}

change_color() {
  case $1 in
    "blue") echo -e -n "\033[0;34m" ;;
    "green") echo -e -n "\033[0;32m" ;;
    "red") echo -e -n "\033[0;31m" ;;
    "yellow") echo -e -n "\033[0;33m" ;;
    *) echo "$2" ;;
  esac
}

explanation_for() {
  explanation=$(curl -s https://api.openai.com/v1/chat/completions \
    -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$OPENAI_API_KEY'' \
    -d '{
    "model": "gpt-3.5-turbo",
    "messages": [{"role": "system", "content": "You are a helpful assistant. You explain '$SHELL' commands based on user input, including flags. Your response should be concise."}, {"role": "user", "content": "'"$1"'"}],
    "temperature": 0.0
  }')

  echo $explanation
}

handle_error() {
  change_color "red"
  echo "Error: $1"
  echo "$2"
  abort
}

parse_content() {
  echo $1 | jq -r '.choices[0].message.content'
}

prompt() {
  change_color "blue"
  read -n 1 -r -p "$1"
}

response_for() {
  response=$(curl -s https://api.openai.com/v1/chat/completions \
    -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$OPENAI_API_KEY'' \
    -d '{
    "model": "gpt-3.5-turbo",
    "messages": [{"role": "system", "content": "You are a helpful assistant. You will generate '$SHELL' commands based on user input. Your response should contain ONLY the command and NO explanation. Do NOT ever use newlines to seperate commands, instead use ; or &&. The current working directory is '$(pwd)'."}, {"role": "user", "content": "'"$1"'"}],
    "temperature": 0.0
  }')

  echo $response
}
