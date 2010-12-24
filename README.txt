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

Run make_po.sh via a MinGW shell session to create (or update) the .po
localization files.

Update the files as necessary by hand.

Create the .mo files by running compile_mo.sh.

About the test programs
=======================

simple_test.py is the program documented on my blog posting [1]_.  It
simply displays text based on the current locale.

lang_switch_test.py was a quick test program I added afterwards.  It
is mostly a copy of simple_test.py, except that the desired
translation is loaded and selected on the fly.  This isn't anything
that isn't already documented in the Python docs, but it was written
to see how the method differs from straight gettext.install.

Both programs have been tested on Windows 7 64-bit Japanese, with
preferred language/formats set to US English, using 32-bit Python 2.7.

.. [1] http://www.vultaire.net/blog/2010/12/23/gettext-python-and-windows-a-simple-demo/
