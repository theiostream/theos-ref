# Stripping/Codesigning Variables

The variables in this section pertain to:

* Stripping
* Codesigning

## Tool Specification

%INDENT%

###### TARGET %S%
The system for which Theos is to build projects. Also defines miscellaneous build aspects.  
Refer to [TARGET flags](./3_1_5_TARGET.md#TARGET) for more information.

Defaults and availability are platform-wise.

###### TARGET\_STRIP %R%
Specifies the path to the `strip` tool.  
It is used during executable binary stripping.

Defaults and definition on a per-target basis.

###### TARGET\_CODESIGN %R%
Specifies the path of the codesigning tool.  
It is used during codesigning.

Usually, `ldid`, rather than `codesign`, is used for signing.

Defaults and definition on a per-target basis.

%INDENTEND%

## Flag Specification

%INDENT%

###### TARGET\_STRIP\_FLAGS %S%
Specifies flags to be passed into `strip` upon stripping.  
This variable is an exception to the convention that `TARGET_` variables are meant to be read-only and set only on a per-target basis.

Defaults and definition on a per-target basis.

###### TARGET\_CODESIGN\_FLAGS
Specifies flags to be passed into the codesigning tool upon codesigning.
This variable is an exception to the convention that `TARGET_` variables are meant to be read-only and set only on a per-target basis.

Defaults and definition on a per-target basis.

%INDENTEND%
