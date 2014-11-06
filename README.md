# Pastebin Bash

The goal of this script is to send a file to Pastebin.

## Requirements

A pastebin account is required.

## Configuration

This script requires a configuration file at _$HOME/.pastebin.cnf_ which contains:

```bash
username="pastebin_username"
password="pastebin_password"
api_key="pastebin_api_key"
```

The api_key can be found at http://pastebin.com/api#1

## Usage

Required parameters:

- f: file to send
- p: name of the pastebin
- t: format of the file. See [Formats availables](./formats.md)

## Example

``` ./pastebin.sh -f file_to_send.cpp -p FilePastebinDisplayName -t cpp
```

## Note

This is a first version, pull requests are encouraged! ;)

## Todo

- Remove a past
- Better text display
- Get user informations
- Choose private option
- Choose expire date
