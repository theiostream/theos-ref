# Path Variables

The variables in this section pertain to:

* Querying where Theos stores certain resource files which may need to be referenced.
* Designating directories wherein Theos should store build-related output files.

## Theos Resource Locations

###### THEOS %R%
The path to Theos.

Defined in *common.mk*.

###### THEOS\_MAKE_PATH %R%
The path where Theos' Makefiles are located.
Save `common.mk`, Theos Makefile inclusions should be based on this variable.

Defined in *common.mk*.

###### THEOS\_BIN_PATH %R%
The path where Theos stores its binaries.
Install, query and bootstrap scripts, Logos, NIC, and others are stored here.

Defined in *common.mk*.

###### THEOS\_LIBRARY_PATH %R%
The path where linkable libraries are kept.
This directory is added to the linker's *library search path* for each built instance.

Defined in *common.mk*.

###### THEOS\_INCLUDE_PATH %R%
The path where headers meant for use in Theos projects are stored.
This directory is added to the compiler's *include path* for each built object.

Defined in *common.mk*.

###### THEOS\_MODULE_PATH %R%
The path where [Theos Modules](./6_0_MODULES.md) are stored.

Defined in *common.mk*.

## Project Build Locations

###### THEOS\_BUILD\_DIR %S%
The directory which houses a project's object directory, staging directory and built packages.

Defaults to the project's root directory.
Defined in *common.mk*.


###### THEOS\_OBJ\_DIR\_NAME %S%
The name of the directory which houses a project's built object files and main executable.

Defaults to "obj".
Defined in *common.mk*.

###### THEOS\_STAGING\_DIR %S%
The name of the project's [staging](./4_1_INVOKABLE.md#package) directory.
	
Defaults to "_".
Defined in *common.mk*.
