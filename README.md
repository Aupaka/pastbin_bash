# Pastebin Bash

Script to send file to pastebin

## Requirements

A pastebin account is required.

## Configuration

This script need to create a configuration file: _$HOME/.pastebin.cnf_

```bash
username="pastebin_username"
password="pastebin_password"
api_key="pastebin_api_key"
```

The api_key can be found at http://pastebin.com/api#1

## Usage

Required:

- f: file to send
- p: name of the pastebin
- t: format of the file. See [Formats availables](./formats.md)

## Note

This is a first version, pull requests are encouragees ! ;)

## Todo

- Remove a past
- Better text display
- Get user informations
- Choose private option
- Choose expire date
