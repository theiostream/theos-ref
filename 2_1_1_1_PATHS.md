# Path Variables

The variables in this section pertain to:

* Querying where Theos stores certain resource files which may need to be referenced.
* Designating directories wherein Theos should store build-related output files.

## Theos Resource Locations

###### THEOS %C%
The path to Theos. *Read-only*: $(THEOS) will be overwritten, but might be useful in your first `include` directive.

Defined in *common.mk*.

###### THEOS\_MAKE_PATH %C%
The path where Theos' Makefiles are located. Save `common.mk`, Make inclusions should be based on this variable. *Read-only*.

Defined in *common.mk*.

###### THEOS\_BIN_PATH %C%
The path where Theos stores its binaries, such as install, query and bootstrap scripts, Logos, NIC, and others. *Read-only*.

Defined in *common.mk*.

###### THEOS\_LIBRARY_PATH %C%
The path where linkable libraries are kept. This directory is added to the linker's *library search path* for each built instance. *Read-only*.

Defined in *common.mk*.

###### THEOS\_INCLUDE_PATH %C%
The path where headers meant for use in Theos projects are stored. This directory is added to the compiler's *include path* for each built object. *Read-only*.

Defined in *common.mk*.

###### THEOS\_MODULE_PATH %C%
The path where [Theos Modules](./6_0_MODULES.md) are stored. *Read-only*.

Defined in *common.mk*.

## Project Build Locations

###### THEOS\_BUILD\_DIR %S%
The directory which houses a project's object directory, staging directory and built packages.

Defaults to the project's root directory.<br />
Defined in *common.mk*.


###### THEOS\_OBJ\_DIR\_NAME %S%
The name of the directory which houses a project's built object files and main executable.

Defaults to "obj".<br />
Defined in *common.mk*.

###### THEOS\_STAGING\_DIR %S%
The name of the project's [staging](./4_1_INVOKABLE.md#package) directory.
	
Defaults to "_".<br />
Defined in *common.mk*.
