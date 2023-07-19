#!/bin/bash

# add 'mustache' command, installed by `gem install --user-install mustache`
export PATH=$PATH:~/.gem/ruby/2.6.0/bin

#dirname=$(dirname "$0")
dirname="$PWD"
#echo $dirname

destdir="$dirname/../tmp"
skelname="$1"
projname="${2:-$1}"

# create destination for $projname if it does not exists
mkdir -p $destdir

skeldir="$dirname/$skelname"
projdir="$destdir/$projname"

dummyfile="$dirname/dummy.yaml"

# test if at least 1 argument 
if [ -z "$1" ]; then
    echo "Program needs a skeleton name as argument"
    echo "Usage: $0 <skeleton name> [<destination project name>]"
    exit
fi

# test if skeleton name exist
if ! test -d $skeldir; then 
  echo "'$skelname' is not a skeleton, exiting."
  exit
fi 

# prompt before overwriting 
if test -d $projdir; then 
  echo "Destination $projname exist. Do you want to overwrite?"
  select yn in "Yes" "No"; do
      case $yn in
          Yes ) break;;
          No ) echo "Exiting."; exit;;
      esac
  done
fi 

echo -n "Copying files "
#rsync -a -v --progress "$skeldir" "$projdir" 
#rsync -a -v --progress --ignore-existing "$skeldir" "$projdir" 
cp -r "$skeldir" "$projdir"
echo "OK"

echo -n "Writing variables "
# write variables defined in 'dummy.yaml'
# https://askubuntu.com/a/528661 (brew install moreutils)
find "$projdir" -type f -exec bash -c "mustache \"$dummyfile\" \"{}\" | sponge \"{}\"" \;
echo "OK"

