#!/bin/bash

# Check if server argument is supplied
if [ -z "$1" ]
then
    echo "No argument supplied"
    exit 1
fi

# Get working directory
working_dir=$(dirname -- "$( readlink -f -- "$0")")

# Get the configuration file path
config_file="$working_dir/tagmusic_config.json"

# Get the server directory
server_dir=$1

# Create a temporary mount directory
mount_dir=$(mktemp -d)

# Check if the temporary mount directory was created successfully
if [[ -d "$mount_dir" ]]; then
    echo "Temporary directory created: $mount_dir"
    cd "$mount_dir" || exit 1
    echo "Changed into directory: $(pwd)"
else
    echo "Failed to create temporary directory"
    exit 1
fi

# Trap cleanup statements
trap "fusermount3 -u -z $mount_dir; rmdir $mount_dir; [[ $? -eq 0 ]] && echo Cleaned up temporary directory" EXIT

# Mount the server directory
sshfs "$server_dir" "$mount_dir"
if [[ $? -ne 0 ]]; then
    exit 1
fi

cd "$mount_dir"

# Tag files
onetagger-cli autotagger --config "$config_file" --path "$mount_dir"

# Trap
# fusermount3 -u -z $mount_dir
# rmdir $mount_dir
# [[ $? -eq 0 ]] && echo 'Temporary directory deleted'

