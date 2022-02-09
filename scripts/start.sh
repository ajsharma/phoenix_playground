#!/bin/sh

set -euxo pipefail

docker-compose up -d

pushd playground_application
  # mix ecto.create
  mix phx.server
popd

# Captures and runs
function trap_ctrlc ()
{
    # perform cleanup here
    echo "Ctrl-C caught...performing clean up"
 
    echo "Doing cleanup"

    docker-compose down 
 
    # exit shell script with error code 2
    # if omitted, shell script will continue execution
    exit 2
}
 
# initialize trap to call trap_ctrlc function
# when signal 2 (SIGINT) is received
trap "trap_ctrlc" 2

echo "System is running"
echo "Use Ctrl-C to stop"