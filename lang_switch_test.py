#!/usr/bin/env python

"""A simple test of gettext support on Windows."""

LANG_ENV_VARS = ["LANGUAGE", "LC_ALL", "LC_MESSAGES", "LANG"]

import gettext, locale, os

def check_os():
    if os.name != "nt":
        import warnings
        warnings.warn(
            "This test is only intended for Windows NT-based systems.")

def print_locale():
    for key in LANG_ENV_VARS:
        print key, str(os.environ.get(key))

def is_locale_set():
    for key in LANG_ENV_VARS:
        if key in os.environ:
            return True
    return False

def init_locale():
    # getdefaultlocale returns (locale, encoding).  We only need the first.
    def_locale = locale.getdefaultlocale()[0]
    os.environ["LANG"] = def_locale

def main():
    check_os()

    print "Current locale:"
    print_locale()
    print

    if not is_locale_set():
        init_locale()
        print "Adjusted locale:"
        print_locale()
        print

    translations = [
        gettext.translation("test", localedir="locale", languages=[lang])
        for lang in ("en", "ja")
        ]
    for translation in translations:
        translation.install(unicode=True)
        print _(u"Hello world!")

if __name__ == "__main__":
    main()
