# Schemas ("Schemata")

This section pertains to:

* The creation and use of Theos schemas (nicknamed "Schemata")

## Concept

Schemas are a way to manage a group of master variables which can have their effect easily turned off or on. An example is the built-in `debug` schema, which when enabled adds extra options to CFLAGS.

## Enabling

###### SCHEMA
Specifies enabled schemas.

Defaults to empty.  
Defined in `common.mk`.

## Specifying the Schema

Schema properties can be specified with creation of variables with the following format:  
	schemaname.VARIABLE

In this example, if schema of `schemaname` name is enabled, `VARIABLE` will have its value changed.

