# Stripping/Codesigning Variables

The variables in this section pertain to:

* Stripping
* Codesigning

## Tool Specification

###### TARGET %S%
The system for which Theos is to build projects. Also defines miscellaneous build aspects.  
Refer to [TARGET flags](./3_1_5_TARGET.md#TARGET) for more information.

Defaults and availability are platform-wise.

###### TARGET_STRIP %R%
Specifies the path to the `strip` tool.  
It is used during executable binary stripping.

Defaults and definition on a per-target basis.

###### TARGET_CODESIGN %R%
Specifies the path of the codesigning tool.  
It is used during codesigning.

Usually, `ldid`, rather than `codesign`, is used for signing.

Defaults and definition on a per-target basis.

## Flag Specification

###### TARGET_STRIP_FLAGS %S%
Specifies flags to be passed into `strip` upon stripping.  
This variable is an exception to the convention that `TARGET_` variables are meant to be read-only and set only on a per-target basis.

Defaults and definition on a per-target basis.

###### TARGET_CODESIGN_FLAGS
Specifies flags to be passed into the codesigning tool upon codesigning.
This variable is an exception to the convention that `TARGET_` variables are meant to be read-only and set only on a per-target basis.

Defaults and definition on a per-target basis.

