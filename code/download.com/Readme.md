# DOWNLOAD.COM

Software related to Grante Searle's [DOWNLOAD.COM utility and CP/M Tools](http://searle.x10host.com/cpm/index.html#ROMFiles).

I could not get his Windows program working on Windows 10 or 11 because it would
not load the `comdlg32.ocx` file to register or load. I suspect that I am
missing an old C++ runtime redist because I tried several ways of loading it
and regiseteing it.

Instead, I found [filepackage.py](filepackage.py) by Marco Maccaferri which
does the same thing. It is a python script that duplicates the functionality
of Grant's Windows program and has the advantage that it will work on Linux.

By default, the python script will just output the stream of ASCII to STDOUT
ready to by copied and pasted into a terminal window. It also has options to
write directly to the serial port, but I don't use that.
