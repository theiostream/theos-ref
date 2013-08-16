# Variables

%INDENT%

Theos provides variables that can be modified to control the build process on a global and per-[instance](./2_1_2_INSTANCES.md) basis.

For general information on *make Variables*, refer to [*Using Variables*](http://www.gnu.org/software/make/manual/make.html#Using-Variables) in the GNU make Manual.

%INDENTEND%

## Variable Types and Scope

%INDENT%

* **Constants (%R%)**: Variables whose values should not be changed. They are used for querying the build environment and theos settings. They are valid across all Theos Makefiles.

* **System Variables (%S%)**: Variables that can be set to modify global state for all instances and sub-instances under a given Makefile. Variables of this sort are shared between make and sub-make instances.

* **Command-line Variables (%C%)**: Variables specifically designed to be set during a command-line invocation of `make`. These variables also modify state for all instances and sub-instances under a given Makefile.

* **Local Variables (%L%)**: Variables whose value is valid only on the Make instance where they are defined.

* **Private Variables**: Undocumented variables which are either deprecated or aren't meant to be used.

For more detail on the scoping of make variables, refer to [*Recursive Use of Make*](http://www.gnu.org/software/make/manual/make.html#Recursion) in the GNU make Manual.

A Theos convention holds that, save `THEOS_`-prepended variables, lowercase variable names are to be used as Command-Line Variables and uppercase ones to be defined in Makefiles. This will be discussed further on a per-variable basis.

This section of the documentation is split into two main parts: **Master Variables** (which specify global build settings) and **Instance Variables** (which specify instance-specific build settings). For more details on instances, refer to [Section 2.1.2](./2_1_2_INSTANCES.md).

%INDENTEND%
