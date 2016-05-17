# TBDump

*Note: Still lots of TODO's. Consider this a beta.*

### What is this?

An (unofficial) XCode accessory, to dump .tbd files off dylibs and frameworks.

### Why would I need this?

> *TL;DR*: ld64 for iOS can no longer link against dylibs, and Apple stopped shipping tbd's for private APIs.

Because starting with XCode 7, the linker for iOS on arm64 will no longer accept Mach-O shared libraries to link against, but only .tbd files.

So you will only need this if all of the following hold true:

* You develop for iOS
* You target arm64
* You link against anything else than the iOS SDK public API

You won't *need* it for anything else... for now (there exists a `/usr/lib/libSystem.B_debug.tbd` in El Capitan, so things might change).  
You should still be able to use it for any other platform though, and it will certainly reduce the SDK size.

### How do I build it?

To build for your current platform:

    make

To build a fat Mach-O for armv7, arm64 and x86_64:

    make fat

### How do I use it?

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

### TODO

* Support dumping fat files
* Implement recursive mode
* Support inlining re-exports
* Linux support
* Test the hell out of this
