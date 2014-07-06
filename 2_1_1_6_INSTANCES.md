# Instance Name Variables

The variables in this section pertain to:

* Declaring Instances

## Concept

%INDENT%

The concept of instances can be found inside the [Instances](./2_1_2_INSTANCES.md) section, as well as a differentiation in depth of each default instance type, and how instance names come into effect.

Due to a conceptual paradigm, we chose to document these variables under the Master Variables section to later expand on them on the Instances section.

%INDENTEND%

## Variables

%INDENT%

All variables default to an empty value.

###### TOOL\_NAME

Specifies space-separated tool instance names.

Requires `tool.mk` to be imported to take effect.

###### LIBRARY\_NAME

Specifies space-separated library instance names.

Requires `library.mk` to be imported to take effect.

###### TWEAK\_NAME

Specifies space-separated tweak instance names.

Requires `tweak.mk` to be imported to take effect.

###### BUNDLE\_NAME

Specifies space-separated bundle instance names.

Requires `bundle.mk` to be imported to take effect.

###### APPLICATION\_NAME

Specifies space-separated application instance names.

Requires `application.mk` to be imported to take effect.

###### FRAMEWORK\_NAME

Specifies space-separated framework instance names.

Requires `framework.mk` to be imported to take effect.

###### SUBPROJECT\_NAME

Specifies space-separated subproject instance names.

Required `subproject.mk` to be imported to take effect.

%INDENTEND%
