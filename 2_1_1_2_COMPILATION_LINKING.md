# Compilation/Linking Variables

The variables in this section pertain to:

* Compilation
* Linking

## Specifying the tools

###### TARGET %S% [RE]
The system for which Theos is to build projects. Different targets are available on different platforms. Refer to [TARGET flags](./3_1_5_TARGET.md#TARGET) for more information.

###### TARGET_CC %R%
Specifies the path to the C compiler.  
It is used during compilation of C and Objective-C files.

Defaults to `gcc`.  
Defined on a per-target basis.

###### TARGET_CXX %R%
Specifies the path to the C++ compiler.  
It is used during compilation of C++ and Objective-C++ files.

Defaults to `g++`.  
Defined on a per-target basis.

###### TARGET_LD %R%
Specifies the path to the linker.  
It is used during linkage of object files.

Defaults to `g++`.  
Defined on a per-target basis.

## Flags for tools

ADDITIONAL_*FLAGS

*FLAGS

OPTFLAG

DEBUG -> SCHEMA
