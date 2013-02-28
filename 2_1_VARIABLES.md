# Variables

Theos contains a number of Makefiles which can read from currently-defined variables in the Makefile where included, and from this value implement variating behavior during the build process.

Different variables are parsed by different Theos Makefiles in order to provide desired functionality.

For general information on *Make Variables*, refer to [*Using Variables*](http://www.gnu.org/software/make/manual/make.html#Using-Variables) at the Make Manual.

## Variable Types

Variables designed to define Theos functionality can differ in scope:

### Regarding scope

* **Constants**: Variables whose value shouldn't be changed. They are used for querying information regarding the build environment and settings. They are valid across all Theos Makefiles.

* **System Variables**: Variables whose value is shared between Make and Sub-make instances.

* **Command-line Variables**: Variables specifically designed to be set during a command-line invocation of `make`. They hold scope across Sub-make instances.

* **Local Variables**: Variables whose value is valid only on the Make instance where they are defined.

* **Private Variables**: Undocumented variables which are either deprecated or aren't meant to be used in Theos Makefiles.

For more detail on scoping of Make variables, refer to [*Recursive Use of Make*](http://www.gnu.org/software/make/manual/make.html#Recursion) on the Manual.

A Theos convention states that save `THEOS_`-prepended variables, lowercase variable names are to be used as Command-Line Variables and uppercase ones to be defined in variables. More details will be discussed as each variable is presented.

This section of this documentation is split into two main parts: **Master Variables** (which specify project building settings) and **Instance Variables** (which specify instance building settings). For more details on instances refer to [Section 2.1.2](./2_1_2_INSTANCES.md).