#!/bin/bash
##
## Naively guess the applications installed via Homebrew casks
## and remove barriers for first-time launching:
##   - Add to the system-wide security assessment database
##   - Remove quarrantine bits on all of the files
##

sudo -v

if [ -z "$(which jq)" ] ; then
  echo "This script requires jq (JSON query CLI)."
  echo "brew install jq"
  exit 1
fi

## Get list of installed casks
CASKS=$(brew cask list)

## Generate a list of artifacts
ARTIFACTS=$(brew cask info $CASKS --json=v1 | jq '.[].artifacts[]|arrays[]|select(. | match(".app$")?)')

## For each artifact, add to Gatekeeper-approved list and remove quarrantine bits
while IFS=$'\n' read -r line ; do
  artifact="/Applications/$(echo $line | tr -d '"')"
  if [ -d "$artifact" ] ; then
    echo "Fixing $artifact"
    sudo spctl --add "$artifact"
    sudo xattr -r -d com.apple.quarantine "$artifact"
  else
    echo "Skipping $artifact"
  fi
done < <(printf %s "$ARTIFACTS\n")