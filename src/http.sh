#!/usr/bin/env bash

## http.sh
## local web servers on different ports
## requires php, php-cli

## local web servers

abby() {
  php -S localhost:8899
}

bobby() {
  php -S localhost:8898
}

cammy() {
  php -S localhost:8897
}
