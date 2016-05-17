*Note: Still lots of TODO's. Consider this a beta.*

# What is this?

An (unofficial) XCode accessory, to dump .tbd files off dylibs and frameworks.

# How do I build it?

To build for your current platform:

    make

To build a fat Mach-O for armv7, arm64 and x86_64:

    make fat

# How do I use it?

Like this:

    tbdump mylib.dylib > mylib.tbd

For help, run with no arguments (*note: -r still unimplemented*):

    Usage:
        ./tbdump-fat [-f] dylib
        ./tbdump-fat -r [-f] folder

    Description:
        Create text-based stub libraries (.tbd files) from dylibs or frameworks.
        In default mode, output is written to stdout.
        Use "-" to read from stdin.

    Options:
        -f  Force parsing of all files and ignore all I/O and format errors.
        -r  "Recursive mode": Recurse into a directory, parsing all files whose
            names end in ".dylib" or which have no suffix at all.
            Rather than writing to stdout, rebuild the source directory tree in the
            current directory, with .tbd files replacing dylibs and frameworks.

Return values:
    0   Success
    1   Generic error
    2   Invalid argument
    3   Memory error
    4   File I/O error
    5   Data fornat error

# TODO

* Support dumping fat files
* Implement recursive mode
* Linux support
* Test the hell out of this
