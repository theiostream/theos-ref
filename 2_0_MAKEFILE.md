# Makefiles

Theos is simply a **set of makefiles** designed initially to allow development for the iPhone non-Xcode-dependent, but evolved into a powerful system useful for any case where a common Makefile would be used.

Defined variables or rules will be parsed with **Theos Makefiles** included using the Make `include` directive on your project's Makefile. Without any Theos Makefiles included, the invocation to the `make` tool has no effect but the normal one.

There are many kinds of special variables on Theos and a set of rules which will be documented on the following sections:

* Variables
	* Master Variables
		* Theos Path Variables
		* Compilation/Linking Variables
		* Stripping/Signing Variables
		* Schemas
		* Targets
		* Instances
		* Other
		
	* Instance Variables
		* Instance Specifiers
		* Instance Variables
			* Bundles
				* Applications
			* Libraries
				* Tweaks
			* Tools

* Rules
	* Invokable
	* Implementable

* Modules