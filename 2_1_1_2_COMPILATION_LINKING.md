# Compilation/Linking Variables

The following variables in this section described regard ones which alter the behavior of the compilation and linking process, done by the compiler.

## Specifying the tools

###### TARGET %S%
Using the `clang` flag, uses the **clang** compiler on Mac OSX(?) instead of **gcc** or **g++** without need to set TARGET\_CC. Refer to [TARGET flags](./3_1_5_TARGET.md#TARGET).

###### TARGET_CC %S%
Specifies the path to the C compiler to be used during compilation of C and Objective-C files.

Default is `gcc`, [defined](./3_1_5_TARGET.md#Tools) by platform and target.<br />
Defined on *common.mk*.

###### TARGET_CXX %S%
Specifies the path to the C++ compiler to be used during compilation of C++ and Objective-C++ files.

Default is `g++`, [defined](./3_1_5_TARGET.md#Tools) by platform and target.<br />
Defined on *common.mk*.

###### TARGET_LD %S%
Specifies the path to the linker to be used during linkage of object files.

Default is `g++`, [defined](./3_1_5_TARGET.md#Tools) by platform and target.<br />
Defined on *common.mk*.

## Flags for tools

ADDITIONAL_*FLAGS
*FLAGS
OPTFLAG
DEBUG -> SCHEMA