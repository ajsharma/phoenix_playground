#!/bin/sh

# Starter script to install the requirements to make this project work.
# 
# Steps are designed to be idempotent, but probably aren't perfect at this 
# point.
# 
# Likely, running this script after weeks will cause updates, but hopefully, 
# running it multiple times within one day is predictable.

set -euxo pipefail

echo 'Installing elixir'
brew install elixir

echo 'Setting up play playground_application'
pushd playground_application
  # Create an example env
  # https://superuser.com/questions/118781/copy-files-in-linux-avoid-the-copy-if-files-do-exist-in-destination
  # 
  # -n is to ensure 
  cp -n .env.example .env

  # Setup database
  mix ecto.create
popd
