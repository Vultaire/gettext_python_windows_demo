#!/bin/bash

# Define the languages we'll localize for.
langs="en ja"  # modify as desired
localeroot="locale"  # Change as desired.  .mo's are created inside.

# Force an English LANG setting (to make MinGW's gettext utilities
# happy in non-english locales)
export LANG=en

for lang in $langs; do
    locale_dir="${localeroot}/${lang}/LC_MESSAGES"
    mkdir -pv "${locale_dir}"
    msgfmt "po/${lang}.po" -o "${locale_dir}/${lang}.mo"
done
