# Targets and Platforms

This section pertains to:

* Detailed explanation of setting the `TARGET` variable, defined in previous sections as a way of controlling the build process.
* Information on how targets and platforms are defined and handled by Theos.

## Selecting a target

%INDENT%

###### TARGET %S% (String)

The system for which Theos is to build projects. Also defines miscellaneous build aspects.  
Defaults and availability are platform-wise.

TARGET flags are split by colons (`:`), and different targets may parse these flags in different ways. The first flag is always used to define the target name, still.

For more information on how Theos' default targets handle flags, read [Theos Default Targets](./2_1_1_5_1_DEFAULT_TARGETS.md). This document focuses on the behavior of Theos regarding targets.

Theos Targets should never directly read from `TARGET`. For more information, refer to [\_THEOS\_TARGET\_ARG\_X](nolink).

%INDENTEND%

## Platforms

%INDENT%

Platforms are automatically picked by Theos through the output of `uname -s` (kernel name). For more information on this tool, refer to [uname(1)](http://linux.die.net/man/1/uname).

Each platform has a makefile included to define special behavior through variables. This makefile is placed at `$(THEOS_MAKE_PATH)/platforms/<platform name>.mk`.

These variables are described as follows. This section does not focus on the behavior defined by default Theos platforms. For such information, refer to [Theos Default Platforms](./2_1_1_5_2_DEFAULT_PLATFORMS.md).

###### \_THEOS\_PLATFORM\_LOADED %?% (Boolean)

Defines whether Theos has loaded a platform.

Each platform should check for this value to be undefined before defining platform variables, and when doing so, it should set this variable to [TRUE](./2_1_1_X_VARIABLE_CLASSES.md#Boolean).

Defaults to empty.

###### THEOS\_PLATFORM\_NAME %?% (String)

The human-readable name of this platform, rather than the kernel name of the system.

Defaults to empty.

###### \_THEOS\_PLATFORM\_DEFAULT\_TARGET %?% (String)

The default target for the platform to build to. Refer to [Target Selection](./2_1_1_5_TARGETS.md#targets) for more detail.

Defaults to empty.

###### \_THEOS\_PLATFORM\_DU\_EXCLUDE %?% (String)

The exclude flag for [du(1)](http://linux.die.net/man/1/du).

Defaults to empty.

###### \_THEOS\_PLATFORM\_MD5SUM %?% (String)

The name of the MD5 Sum generation program in the system.

Defaults to empty.

%INDENTEND%

## Targets

%INDENT%

Targets are picked by Theos through the Target Name. The Target Name can be defined either on the platform (through the [\_THEOS\_PLATFORM\_DEFAULT\_TARGET](needlink) variable, or through the first flag of the [TARGET](needlink) variable.

Targets can be part of one of the following categories:

* Native: It describes the building process having as a target the same platform it's built at.
* Non-native: It describes the building process having as a target a different platform from the one it's built at.

Each target has a makefile included to define special behavior through variables. This makefile should be placed at `$(THEOS_MAKE_PATH)/targets/<platform name>/<target name>.mk`. Usually, platform target directories should contain a `native.mk` makefile symlinking to the native target.

These variables are defined as follows. This section does not focus on the behavior defined by default Theos platforms. For such information, refer to [Theos Default Targets](./2_1_1_5_2_DEFAULT_TARGETS.md).

These variables should *only* be set by the target if they are previously undefined, otherwise the user's build configuration might be overriden.

Before defining these variables, check for `_THEOS_TARGET_LOADED` being undefined. They should only be set if this condition is true.

Some rules can also be defined or overriden in these makefiles.

*(NOTE: In this context variables marked as system-wise are usually **only** to be written in this context, and should be considered read-only for other purposes.)*

### Common Variables

%INDENT%

By a convention these variables should be placed at `$(THEOS_MAKE_PATH)/targets/_common/<target name>.mk`, and later included by the actual target makefile.

Other variables which can be internally reused across targets should be placed here.

###### TARGET\_EXE\_EXT %S% (String)

Defines the extension for binaries for the target.

Defaults to empty.

###### TARGET\_LIB\_EXT %S% (String)

Defines the extension for libraries for the target.

Defaults to empty.

###### TARGET\_LDFLAGS\_DYNAMICLIB

###### TARGET\_CFLAGS\_DYNAMICLIB

###### \_THEOS\_TARGET\_ONLY\_OBJCFLAGS

###### \_THEOS\_TARGET\_SUPPORTS\_BUNDLES

%INDENTEND%

### Target Variables

%INDENT%

###### \_THEOS\_TARGET\_LOADED (Boolean)

Defines whether the target was loaded.  
Should always be set to `true` on the start of the target Makefile.

Defaults to empty.

###### THEOS\_TARGET\_NAME

Defines the name of the target.  
Should always be set.

Defaults to empty.

###### TARGET\_CC %S% (String)

Defines the path of the C compiler for the target.

Defaults to empty.

###### TARGET\_CXX %S% (String)

Defines the path of the C++ compiler for the target.

Defaults to empty.

###### TARGET\_LD %S% (String)

Defines the path of the linker for the target.  
Should usually be set to the C++ compiler.

Defaults to empty.

###### \_THEOS\_TARGET\_CFLAGS %S% (String)

Defines compiler flags specially from the target.  

Defaults to empty.

###### \_THEOS\_TARGET\_LDFLAGS %S% (String)

Defines linker flags specially from the target.  
Should contain `-multiply_defined suppress`.

Defaults to empty.

###### TARGET\_STRIP

Defines the path of the [strip(1)](http://linux.die.net/man/1/strip) tool.

Defaults to empty.

###### TARGET\_STRIP\_FLAGS

Defines the flags for the [strip(1)](http://linux.die.net/man/1/strip) tool.

Defaults to empty.

###### TARGET\_CODESIGN\_ALLOCATE

Defines the path for the [codesign\_allocate(1)](http://developer.apple.com/library/Mac/#documentation/Darwin/Reference/ManPages/man1/codesign_allocate.1.html) tool.

Defaults to empty.

###### TARGET\_CODESIGN

Defines the path for the codesigning tool.  
It can be usually set to [codesign(1)](https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man1/codesign.1.html) or `ldid`.

Defaults to empty.

###### TARGET\_CODESIGN\_FLAGS

Defines the flags for the codesigning tool.

Defaults to empty.

###### TARGET\_PRIVATE\_FRAMEWORK\_PATH

The path to private frameworks inside the sysroot.

Defaults to empty.

###### ARCHS

Defines the architecture of the output object files for the target.

Defaults to empty.

%INDENTEND%

### Target Data Variables

%INDENT%

These variables can be read by the target to suit itself to the project's needs.

###### \_\_THEOS\_TARGET\_ARG\_X

Special variable name. Here, *X* is a number which starts on 1.

This variable can be used for querying the Xth flag of the `TARGET` variable, instead of directly parsing the `TARGET` variable.

This variable is empty if the Xth flag of `TARGET` is empty. Otherwise, it is filled with content.

###### SYSROOT

This variable, if defined, specifies the desired system root for the target. Its data should then be considered when setting `_THEOS_TARGET_CFLAGS` and `_THEOS_TARGET_LDFLAGS`.

Defaults to empty.

%INDENTEND%

%INDENTEND%
