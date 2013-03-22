# Compilation/Linking Variables

The variables in this section pertain to:

* Compilation
* Linking

## Specifying the tools

(Organization note: SCHEMA is not here, so should TARGET be, since it doesn't specify any tool directly? It seems right, but doesn't quite make sense if analyzed so)

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

[[ NOTE: Dustin, please revise ADDITIONAL_* variables, I may be wrong with what compiles what and stuff. ]]

###### ADDITIONAL_CFLAGS %L%
Specifies additional flags to be passed into the C and C++ compiler upon compilation.
It is used during compilation of C, Objective-C, C++ and Objective-C++ files.

Defaults to empty.
Defined on `common.mk`.

###### ADDITIONAL_CCFLAGS %L%
Specifies additional flags to be passed into the C++ compiler upon compilation.
It is used during compilation of C++ and Objective-C++ files.

Defaults to empty.
Defined on `common.mk`.

###### ADDITIONAL_OBJCFLAGS %L%
Specifies additional flags to be passed into the Objective-C compiler upon compilation.
It is used during compilation of Objective-C and Objective-C++ files.

Defaults to empty.
Defined on `common.mk`.

###### ADDITIONAL_OBJCCFLAGS %L%
Specifies additional flags to be passed into the Objective-C++ compiler upon compilation.
It is used during compilation of Objective-C++ files.

Defaults to empty.
Defined on `common.mk`.

###### ADDITIONAL_LDFLAGS %L%
Specifies additional flags to be passed into the linker.
It is used during linking of object files.

Defaults to empty.
Defined on `common.mk`.

###### ADDITIONAL_LOGOSFLAGS %L%
Specifies additional flags to be passed into the [Logos Preprocessor](http://theiostream.com/logos).
It is used during preprocessing of Logos files.

###### OPTFLAG %L%
Specifies the compiler optimization flag.

Defaults to `-O2`.
Defined on `common.mk`.

## Miscellaneous

###### DEBUG (what's the scope?) [DEPRECATED]
Controls compilation of debug symbols and stripping.
Being used, adds `-ggdb -DDEBUG` to the compiler flags and disables optimization and stripping. `+debug` is also added to the package build identifier.

DEPRECATED IN FAVOR OF THE [`debug` SCHEMA](./2_1_1_3_SCHEMATA#debug.md).
This was written during a Skype conversation with females.

Defaults to `false`.
Defined on `common.mk`.

ADDITIONAL_*FLAGS

*FLAGS

OPTFLAG

DEBUG -> SCHEMA
