# Theos Platforms

This document pertains to:

* Platforms available in the Theos installation, and how they behave.

### Darwin (OSX)

%INDENT%

In this platform the native SDK root is set through [xcode-select(1)](http://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man1/xcode-select.1.html), with the `-print-path` option.

The default target is `iphone`, the [du(1)](http://linux.die.net/man/1/du) exclude flag is `-I`, and the MD5Sum generation program is called `md5`.

%INDENTEND%

### Darwin-arm (iPhone OS)

%INDENT%

In this platform there is no set SDK root, as the default and only supported target is the native.

The [du(1)](http://linux.die.net/man/1/du) exclude flag is `--exclude`, and the MD5Sum generation program is `md5sum`.

%INDENTEND%

### Linux

%INDENT%

In this platform there is no set SDK root. 

The default target is `iphone`, the [du(1)](http://linux.die.net/man/1/du) exclude flag is `--exclude`, and the MD5Sum generation program is `md5sum`.

%INDENTEND%
