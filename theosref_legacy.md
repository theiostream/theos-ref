

#### Handling targets
###### TARGET
Define the target, SDK version and deployment target for the project.<br />
For usage/defaulting, refer to the **Platforms / Targets** section of this document.

###### ARCHS
Define the architecture(s) which to build to.<br />
For usage/defaulting, refer to the **Platforms / Targets** section of this document.

###### SYSROOT
Manually define the path to the sysroot for cross-compiling.<br />
For usage/defaulting, refer to the **Platforms / Targets** section of this document.

###### SDKBINPATH
Manually define the path to build tools on iPhone and Linux platforms.<br />
For usage/defaulting, refer to the **Platforms / Targets** section of this document.

###### SDKTARGET
Manually define the prefix for iPhone-related cross-compiling tools on iPhone and Linux platforms.<br />
For usage/defaulting, refer to the **Platforms / Targets** section of this document.

#### Handling paths to building executables
###### TARGET_STRIP
###### TARGET\_STRIP_FLAGS
###### TARGET\_CODESIGN_ALLOCATE
###### TARGET_CODESIGN
###### TARGET\_CODESIGN_FLAGS

### Local Variables
Local variables scope on the current Make instance, yet are not shared through Sub-make instances, unlike System Variables.

Although, with the use of the `export` directive from Make, those variables will be shared through every sub-make. For more information on the topic, refer to [Sending Variables to a sub-make instance](http://www.gnu.org/software/make/manual/make.html#Variables_002fRecursion) on the Make manual.

If one of these are passed in as **command-line variables**, they will also scope for sub-make instances, going against the concept of a local variable. Even not possible at times, the use of variables specifically designed for command-line use are preferred over their local equivalents when defining them from an invocation to the `make` tool.

#### Providing additional flags for build programs.	
These variables have no default values.

- ADDITIONAL_CFLAGS
	Additional flags to be passed to the C and C++ compiler every compilation inside the project.

- ADDITIONAL_CCFLAGS
	Additional flags to be passed to the C++ compiler every compilation inside the project.

- ADDITIONAL_OBJCFLAGS
	Additional flags to be passed to the Objective-C and Objective-C++ compiler every compilation inside the project.

- ADDITIONAL_OBJCCFLAGS
	Additional flags to be passed to the Objective-C++ compiler every compilation inside the project.

- ADDITIONAL_LDFLAGS
	Additional flags to be passed to the linker every link process inside the project.

- ADDITIONAL_LOGOSFLAGS
	Additional flags to be passed to the Logos Preprocessor when ran inside the project.
	(check the "Logos" document for more information)

#### Controlling Miscellaneous Build Aspects
- OPTFLAG
	The compiler flag for compiler optimization.
	Its default value is "-O2".

- DEBUG
	!! Deprecated !! in favor of the DEBUG schema.
	Accepts 0 and 1, respectively to not enable debug-building or do the opposite.
	Default value is 0.

#### Setting schemas
- SCHEMA
	Special variable.
	Check the "Schemas" section.

### Command-line Variables
These variables, worth for project-wide (as System Variables) are meant to be **specifically** passed as command-line arguments to `make`.

For the section regarding passing such arguments, check http://www.gnu.org/software/make/manual/make.html#Overriding

#### Providing additional flags for build programs.
These variables have no default values.

- CFLAGS
	Additional flags to be passed to the C and C++ compiler every compilation inside the project.

- CCFLAGS
	Additional flags to be passed to the C++ compiler every compilation inside the project.

- OBJCFLAGS
	Additional flags to be passed to the Objective-C and Objective-C++ compiler every compilation inside the project.

- OBJCCFLAGS
	Additional flags to be passed to the Objective-C++ compiler every compilation inside the project.

- LDFLAGS
	Additional flags to be passed to the linker every link process inside the project.

- LOGOSFLAGS
	Additional flags to be passed to the Logos Preprocessor when ran inside the project.
	(check the "Logos" document for more information)

#### Install-related variables
- THEOS_DEVICE_IP
	The IP to where the `make install` rule should transfer the produced Debian package through `make package` to.
	For more details on the `make install` rule, verify the "Built-in Rules" section.
	
	It defaults to nothing.

#### Making the build process verbose
- messages
	Does not filter build process messages from stdout.
	Takes either "yes" or "no", respectively whether to print messages or not.
	
	It defaults to "no".

#### Setting schemas
- schema
	Special variable.
	Check the "Schemas" section.

### Schemas
Schemas' scope are local: just as Local Variables (they are valid for the project, but not for subprojects).

Through the SCHEMA or schema variables and other definitions, schemas are a nice way of dynamically setting Theos behaviour such as appending compiler/linker flags, setting subprojects, etc.

Schemas are enabled through a definition at the SCHEMA or schema variables.
Example: SCHEMA = awesome cool (here schemas "awesome" and "cool" are enabled)

In some cases Theos looks for variables under enabled schemas. If looking for "X", it'll run over enabled schemas to find "X".

Let's say we have To find "X" under "AWESOME" – a currently enabled schema –, Theos will look for a variable named "AWESOME.X" defined.

Example:
	# A case where Theos requires schemas is when asking for additional compiler flags.
	# Here, it would find the enabled schema "awesome".
	# Then it would use an internal function to find "CFLAGS" under enabled schemas.
	# On our case, since "awesome" is enabled it'll find "awesome.CFLAGS"...
	# ...which we declare here
	
	awesome.CFLAGS = -DAWESOME
	SCHEMA = awesome

Under enabled schemas, the following possibilities can be searched (whereas x is an enabled schema):
- x.SUBPROJECTS

### Private Variables
Theos contains private/internal variables which are not documented here. As much as they may seem public and undocumented, *they are private*.

You are, of course, able to set them anyway. Although you should hear what Dustin has to say about it:
[22:46:27] <@DHowett> [...] internal, not public. setting it directly splodes things

Yes, **splodes** (like, KABOOM). Pretty bad, huh?

## Instances

## Platforms / Targets
	### Fundamentals
	The whole process of finding the correct SDK and setting the right target serves a more noble and important purpose: To define the sysroot and the sdkbinpath for building your software.
	
	The SYSROOT is an absolute path which can be specified to the compiler through the --sysroot or -isysroot compiler flags. It is an absolute path to gather libraries, frameworks and headers for building.
	When building natively, the sysroot is the system root directory (/), from where we are able to track linkable libraries, frameworks or headers, in places such as /usr/lib.
	When building for another platform – on our case, the iPhone – there is a SDK, which works basically as a sysroot for this device outside it! So we can link to frameworks, libraries and headers from the iPhone specifically, located in places such as SYSROOT/usr/lib.
	That makes it possible building for the platform outside it. This is called cross-compiling.
	
	The SDKBINPATH is a path where tools for cross-compiling can be found, such as the actual cross-compiler (which will compile stuff with iPhone stuff to build iPhone stuff), a linker, etc. Basically a whole development tool suite for a platform inside another platform.
	
	The next section will cover how Theos handles such things by default and how you can make Theos adapt specifically for your needs to find such things.
	
	#### Targets
	A target is, in theos, one of the following:
	- iphone (build for the iPhone)
	- macosx (build for Mac OSX)
	- simulator (build for the iPhone Simulator)
	- native (build for the platform Theos is currently running at)
	The default target is always "iphone".
	
	#### SDK Version
	The SDK version is used to define the target's SDK to use when building.
	If there are multiple SDK version in the SDK path, through the version inserted here it'll be able to decide which SDK specifically it'll use as a sysroot.
	
	#### Deployment target
	The deployment target defines how far back can your software run. If, for instance, the deployment target is iOS 4.3, it won't be run-able on older iOS versions.
	
	### Building for the iPhone
	#### Finding the SDK
	Through these three values, it is possible to define the location of the SDK.
	- On Linux the SDK is assumed to be at /opt/iphone-sdk-3.0/sysroot.
	- On the iPhone the SDK is assumed to be at /var/sdk. It is not able to use the actual system root as the sysroot for building since Apple compressed all of linkable frameworks on the iOS filesystem on the dyld shared cache.
	- On OSX it'll use xcode-select(1) and xcrun(1) to define the iPhone SDK path and through text processing will force in the value inserted inside TARGET. If none of them are set, will get the latest one.
	
	#### Finding build tools
	And it is also possible to define the tools to use:
	- On OSX xcrun(1) is used to define the location of these tools.
	- On the iPhone the tools located at /usr/bin prefixed under SDKTARGET will be used.
	- On Linux the tools located at /opt/iphone-sdk-3.0/prefix/bin prefixed under SDKTARGET will be used.
	On both cases SDKTARGET defaults to "arm-apple-darwin9".
	
	On Linux or on the iPhone platform, you may use the SDKBINPATH variable to define the path of these tools, to be found alongside SDKTARGET.
	The path to these tools may also be specified in variables documented under "Binary Variables" under "System Variables" under "Variables".
	
	#### Setting Values
	The TARGET variable defines the target for the project to be built and can optionally set SDK version and deployment target for the software.
	
	For target iphone, it is defined as:
	TARGET = iphone (sets iPhone target)
	TARGET = :sdkversion: (sets only SDK version; valid as "iphone" is the default target)
	TARGET = ::deploymenttarget (sets only deployment target; valid as "iphone" is the default target)
	TARGET = iphone:sdkversion (sets iPhone target and SDK version)
	TARGET = iphone::deploymenttarget (sets iPhone target and deployment target)
	TARGET = iphone:sdkversion:deploymenttarget (sets iPhone target and other values)
		
	If the level of control for picking the SDK/Bin Path is not enough through the TARGET variable, it is possible to manually set the following variables:
	
	- SYSROOT
	The sysroot for cross-compiling.
	For information on defaulting, refer to "Finding the SDK".
	
	- SDKBINPATH
	On the iPhone and Linux, the path to look for command-line tools related to cross-compiling.
	For information on defaulting, refer to "Finding build tools".
	
	- SDKTARGET (not related to TARGET whatsoever)
	On the iPhone and Linux, defaulting to "arm-apple-darwin9", is used as a prefix for command-line tools specific to cross-compiling for the iPhone. It can be set to change that specific prefix.
	For more details and information on defaulting, refer to "Finding build tools".
	
	#### Architectures
	There are certain limitations when picking the architecture for building on the iPhone. It depends mostly on the deployment target it requires or SDK limitations.
	
	Relying on the deployment target defined within TARGET and assumed to be !!WHAT IS IT TO BE ASSUMED?!!, the following architectures are defined for building:
	- Builds for (armv7, armv7s) when targeting 6.0+
	- Builds for (armv6, armv7) when targeting 3.0+
	- Builds for (armv6) when targeting 2.0+
	
	The following SDK limitation applies:
	- When building with SDK 6.0, deploying for 4.3- is forbidden and will have Theos throw an error. !! DOES THE SAME APPLY TO ARMV6? !!
	
	### Building natively for Linux
	When building for Linux, the TARGET variable allows the following formation:
	
	TARGET = linux:<target>
	whereas <target> is the prefix for build tools such as cc and ld, placed there for cross-compiling purposes.
	
	Examples:
	TARGET = linux (sets Linux as Theos Target and build tools are looked for without prefixes)
	TARGET = linux:arm-none-eabi (sets Linux as Theos target and build tools are looked for with the "arm-none-eabi" prefix. When looking for gcc(1) for instance, "arm-none-eabi-gcc" shall be found.
	
	### Building natively for OSX
	#### Targeting
	When building for OSX, the TARGET variable allows the following formation:
	
	TARGET = macosx:<deployment-target>
	
	Examples:
	TARGET = macosx
	TARGET = macosx:10.5 (builds for OSX, and does not allow the program to be run on OSX versions < 10.5)
	
	#### Architectures
	To define the architectures to build for on OSX, define the ARCHS variable:
	
	ARCHS = i386 (build solely for i386)
	ARCHS = i386 x86_64 (build for i386 and x86_64)
	
	The default of this variable when building for OSX is always "i386 x86_64".

-- This document was created by Daniel Ferreira (theiostream), alongside the awesome advice from Dustin Howett (DHowett) and, as always thanks to Max Shavrick (Maximus).
It was composed by referencing Theos' source code, the former document on Theos at http://uv.howett.net/ipf.html and Dustin's awesome talks on IRC (:P).