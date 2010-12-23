For those who are using gettext in their own programs on Windows:

Prerequities
============

Get MinGW/Msys.  I use mingw32 even on 64-bit Windows; if you use the
64-bit version, you do so at your own risk.

The auto-install bundle will provide MinGW, Msys, plus the autotools,
gettext, and other stuff.  Basically: everything you need to get
going.

Procedure
=========

1. Create a list of all source files::

     find . -iname '*.py' > xgettext_sources.txt

2. Extract the strings::

     mkdir po
     xgettext -L python -f xgettext_sources.txt -o po/test.pot

3. Create the localized .po files::

     langs="en ja"  # modify as desired
     for lang in $langs; do
         # English is forced here since errors seem to occur in
         # non-english environments...
         LANG=en msginit -i po/test.pot --locale="$lang" -o "po/${lang}.po"
     done

4. Edit the files by hand

5. Create the .mo files::

     langs="en ja"  # modify as desired
     for lang in $langs; do
         locale_dir="locale/${lang}/LC_MESSAGES"
         mkdir -pv "${locale_dir}"
         msgfmt "po/${lang}.po" -o "${locale_dir}/${lang}.mo"
     done
