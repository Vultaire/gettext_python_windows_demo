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
