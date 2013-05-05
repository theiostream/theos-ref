# Compilation/Linking Variables

The variables in this section pertain to:

* Compilation
* Linking

## Tool Specification

(Organization note: SCHEMA is not here, so should TARGET be, since it doesn't specify any tool directly? It seems right, but doesn't quite make sense if analyzed so)

###### TARGET %S%
The system for which Theos is to build projects. Also defines miscellaneous build aspects.  
Refer to [TARGET flags](./3_1_5_TARGET.md#TARGET) for more information.

Defaults and availability are platform-wise.

###### TARGET_CC %R%
Specifies the path to the C compiler.  
It is used during compilation of C and Objective-C files.

Defaults and definition on a per-target basis.

###### TARGET_CXX %R%
Specifies the path to the C++ compiler.  
It is used during compilation of C++ and Objective-C++ files.

Defaults and definition on a per-target basis.

###### TARGET_LD %R%
Specifies the path to the linker.  
It is used during linkage of object files.

Defaults and definition on a per-target basis.

## Flag Specification

###### ADDITIONAL_CFLAGS %L%
Specifies additional flags to be passed into the C and C++ compiler upon compilation.
It is used during compilation of C, Objective-C, C++ and Objective-C++ files.

Defaults to empty.
Defined in `common.mk`.

###### ADDITIONAL_CCFLAGS %L%
Specifies additional flags to be passed into the C++ compiler upon compilation.
It is used during compilation of C++ and Objective-C++ files.

Defaults to empty.
Defined in `common.mk`.

###### ADDITIONAL_OBJCFLAGS %L%
Specifies additional flags to be passed into the Objective-C compiler upon compilation.
It is used during compilation of Objective-C and Objective-C++ files.

Defaults to empty.
Defined in `common.mk`.

###### ADDITIONAL_OBJCCFLAGS %L%
Specifies additional flags to be passed into the Objective-C++ compiler upon compilation.
It is used during compilation of Objective-C++ files.

Defaults to empty.
Defined in `common.mk`.

###### ADDITIONAL_LDFLAGS %L%
Specifies additional flags to be passed into the linker.
It is used during linking of object files.

Defaults to empty.
Defined in `common.mk`.

###### ADDITIONAL_LOGOSFLAGS %L%
Specifies additional flags to be passed into the [Logos Preprocessor](http://theiostream.com/logos).
It is used during preprocessing of Logos files.

###### OPTFLAG %L%
Specifies the compiler optimization flag.

Defaults to `-O2`.
Defined in `common.mk`.

## Miscellaneous

###### DEBUG %TODO% [DEPRECATED]
Controls compilation of debug symbols and stripping.
Being used, adds `-ggdb -DDEBUG` to the compiler flags and disables optimization and stripping. `+debug` is also added to the package build identifier.

**DEPRECATED** in favor of the [`debug` SCHEMA](./2_1_1_3_SCHEMATA.md#debug).  
This was written during a Skype conversation with females.

Defaults to `false`.
Defined in `common.mk`.

