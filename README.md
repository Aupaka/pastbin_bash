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

### Send a file

All parameters are required.

- f: file to send
- p: name of the pastebin
- t: format of the file. See [Formats availables](./formats.md)

### Other parameters:

- a: launch at anonymous
- l: list all pastebin
- h: help

## Example

```
./pastebin.sh -f file_to_send.cpp -p FilePastebinDisplayName -t cpp
```

## Results

### Send a file

When a file is sent successfully, the pastebin url is print.

```
http://pastebin.com/EaLFQR2U
```

When an error occured, the pastebin API error is print:

### List pastebin

The return format is XML.

## Note

This is a first version, pull requests are encouraged! ;)

## Todo

- Remove a past
- Better text display
- Get user informations
- Choose private option
- Choose expire date
- Auto-detection of the format according the file extension
- Add results example on the README
- Handle more pastebin API errors for better messages
- For -l option, parse XML.
