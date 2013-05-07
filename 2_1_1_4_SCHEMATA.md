# Schemas ("Schemata")

This section pertains to:

* The creation and use of Theos schemas (nicknamed "Schemata")

## Concept

Schemas are a way to manage a group of [specific master variables](./2_1_1_4_SCHEMATA.md#Affected_Variables) which can have their effect easily turned off or on. An example is the built-in `debug` schema, which when enabled adds extra options to CFLAGS.

## Enabling

###### SCHEMA
Specifies enabled schemas.

Schemas are enabled by their names separated by spaces.

Example:

	# enable schemas "schema1" and "schema2"
	SCHEMA = schema1 schema2

Defaults to empty.  
Defined in `common.mk`.

## Describing the Schema

The schema is described by specifying what variables have their values affected by its enabling. Doing so can be done by declaring a variable with the format `schema.VARIABLE`, so that enabling `schema` will do changes to a possible query of variable `VARIABLE`.

Example:
	
	# Enabling schema1 will add the '-DSCHEMA1ENABLED' additional compiler flags.
	schema1.CFLAGS = -DSCHEMA1ENABLED

## Affected Variables

These variables can be changed by schemas, with different behavior:

(we need description)

* SUBPROJECTS: how?
* OBJ_FILES
* FRAMEWORKS
* LIBRARIES
* PRIVATE_FRAMEWORKS
* CFLAGS
* CCFLAGS
* OBJCFLAGS
* OBJCCFLAGS
* LOGOSFLAGS
* LDFLAGS
* CODESIGN_FLAGS
* STRIP_FLAGS

## Conventions

* Schema names should be lowercase.
