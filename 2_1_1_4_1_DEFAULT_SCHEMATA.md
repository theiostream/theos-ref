# Theos Schemas

This document pertains to:

* Schemas available for use in the default Theos installation, with the `SCHEMA` variable.

###### debug

Controls compilation of debug symbols and stripping.  
When enabled, `--DDEBUG -ggdb` compiler flags are added, `-ggdb` linker flags are added, and optimization is disabled. Additionally, `+debug` is added to the output package name.
