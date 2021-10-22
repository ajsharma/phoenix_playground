#!/bin/sh

set -euxo pipefail

brew install elixir

#https://superuser.com/questions/118781/copy-files-in-linux-avoid-the-copy-if-files-do-exist-in-destination
cp -n .env.example .env
