#! /usr/bin/bash

# Make the script fail if any commands fail.
set -Eeuo pipefail

# Build the .dtx file.
echo "Building the .dtx file"
makedtx -src "hideproofs\.sty=>hideproofs.sty" -doc hideproofs-doc.tex hideproofs

# Cleanup previous files, if needed.
touch hideproofs.zip
touch hideproofs # Make a file if it doesn't exist so we can delete it.
rm hideproofs.zip
rm hideproofs -r

mkdir hideproofs/

echo "Converting line endings from CRLF to LF for"
for file in hideproofs-doc.tex README.md hideproofs.dtx hideproofs.ins hideproofs-doc.pdf; do
  echo "  Converting $file"
  tr -d '\r'  < $file > hideproofs/$file
done

echo "Creating Zip file hideproofs.zip"
zip -r hideproofs.zip hideproofs


