# Compilation/Linking Variables

The variables in this section pertain to:

* Compilation
* Linking

## Specifying the tools

###### TARGET %S%
The system for which Theos is to build projects. Different targets are available on different platform. Refer to [TARGET flags](./3_1_5_TARGET.md#TARGET) for more information.

###### TARGET_CC %S%
Specifies the path to the C compiler to be used during compilation of C and Objective-C files. *Read-only*.

Defaults to `gcc`, [defined](./3_1_5_TARGET.md#Tools) by platform and target.<br />
Defined on a per-target basis.

###### TARGET_CXX %S%
Specifies the path to the C++ compiler to be used during compilation of C++ and Objective-C++ files. *Read-only*.

Defaults to `g++`, [defined](./3_1_5_TARGET.md#Tools) by platform and target.<br />
Defined on a per-target basis.

###### TARGET_LD %S%
Specifies the path to the linker to be used during linkage of object files. *Read-only*.

Defaults to `g++`, [defined](./3_1_5_TARGET.md#Tools) by platform and target.<br />
Defined on a per-target basis.

## Flags for tools

ADDITIONAL_*FLAGS

*FLAGS

OPTFLAG

DEBUG -> SCHEMA
