#!/bin/bash

domain_name="test"  # Should match the "domain" used by the app
langs="en ja"  # modify as desired
locale_root="locale"  # mo's are created in subdirectories inside here.

# Force an English LANG setting (to make MinGW's gettext utilities
# happy in non-english locales)
export LANG=en

for lang in $langs; do
    locale_dir="${locale_root}/${lang}/LC_MESSAGES"
    mkdir -pv "${locale_dir}"
    msgfmt "po/${lang}.po" -o "${locale_dir}/${domain_name}.mo"
done
