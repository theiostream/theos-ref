# The Instance Variable System

Theos features an "instance" system based on that of [GNUStep Make](http://www.gnustep.org/resources/documentation/Developer/Make/Manual/make_toc.html), which allows the developer to manage multiple build targets (libraries, tools, applications...) inside a single project.

Instances specify **what should be built** and **how**, as well as **where it belongs on the filesystem**.

We understand instance variables as variables that, for determined instance, define how something should be built, as opposed to master variables, that apply globally for an entire project. For example, taking `program` as an instance name:

%CODE%

	program_FILES = file.c main.c
	program_FRAMEWORKS = UIKit
	program_INSTALL_PATH = /usr/bin

%CODEEND%

A list of instance names to be built by a project is specified by the [Instance Specifier Variables](./2_1_1_6_INSTANCES.md), documented elsewhere.

This section will document a list of instance variables, both general ones that apply for all instances and specific one for each instance type, and will discuss the application of each instance type in Theos, as well as how to extend Theos by creating instance types.
