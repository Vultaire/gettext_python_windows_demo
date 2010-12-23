#!/bin/bash

domain_name="test"  # Should match the "domain" used by the app
langs="en ja"  # modify as desired

# Force an English LANG setting (to make MinGW's gettext utilities
# happy in non-english locales)
export LANG=en

# Create a list of all source files
find . -iname '*.py' > xgettext_sources.txt

# Extract the strings
mkdir -p po
template="po/${domain_name}.pot"
xgettext -L python -f xgettext_sources.txt -o "$template"

# Create/update the localized .po files
for lang in $langs; do
    outfile="po/${lang}.po"
    if [ -e "$outfile" ]; then
        # File exists; back up the old file and replace with a new
        # one.
        msgmerge "$outfile" "$template" -o "$outfile.new"
        mv "$outfile" "$outfile.old"
        mv "$outfile.new" "$outfile"
    else
        # New file
        msginit --locale="$lang" -i "$template" -o "$outfile"
    fi
done
