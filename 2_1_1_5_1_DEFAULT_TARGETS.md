# Theos Targets

This document pertains to:

* Documentation of the functionality from default Theos targets.

This document will be divided between targets by platform. When documented, `TARGET` variable flags will always start at the second flag (that is, disregarding the target specifier).

## Darwin (OSX)

### iphone (iPhone OS)

#### `TARGET` flags

For this target, the `TARGET` variable flags that can be applied are:

* (Optional) `clang` Flag: If set to `clang`, `clang` is used as the C/C++ compiler instead of `gcc`.
* SDK Version Flag: Defines the SDK version for the build. If empty or set to `latest`, defaults to the latest SDK version found.
* Deployment Target Flag: Defines the deployment target for the build, represented by an iPhone OS version number. If empty, defaults to `3.0`.

#### Variables

Variables which define behavior of this target's configuration are:

###### SYSROOT

Defines the system root for the build.  
Should only be used if there is no way of letting Theos track the SDK traditionally.

Defaults to the `$(THEOS_PLATFORM_SDK_ROOT)/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS<sdkversion>.sdk`.

###### ARCHS

Defines the architecture for the build.
It is not recommended to set this variable, since Theos will attempt to optimize the supported architectures based on the defined deployment target and SDK version.

Defaults to:

* If SDK version is >= 6.0 and deployment target is < 4.3, `armv7`;
* If SDK version is >= 6.0 and deployment target is >= 4.3, `armv7 armv7s`;
* If SDK version is < 6.0, and deployment target is >= 3.0, `armv6 armv7`;
* If SDK version is < 6.0, and deployment target is < 3.0, `armv6`.

#### Tools

Tools are found using [xcrun(1)](http://developer.apple.com/documentation/Darwin/Reference/ManPages/man1/xcrun.1.html), with parameter `-sdk iphoneos`. The tools are defined as follows:

* C Compiler: If `TARGET` flag `clang` was activated, `clang`. Otherwise, `gcc`.
* C++ Compiler: If `TARGET` flag `clang` was activated, `clang++`. Otherwise, `g++`.
* Linker: The C++ Compiler is used.
* Strip: Always named `strip`.
* codesign\_allocate: Found using `xcrun(1)` flag `-find codesign_allocate`.
* codesign: `ldid`.

#### Flags

Regarding the flags of building tools as specified by the target:

* SDK flags are:
	* `-arch <architecture>` for each defined architecture
	* `-isysroot <sysroot>` for the system root
	* `-D__IPHONE_OS_VERSION_MIN_REQUIRED=__IPHONE_<deployment target>` for the deployment target
	* `-miphoneos-version-min=<deployment target>` for the deployment target.

* Flags for the compiler are the above SDK flags.
* Flags for the linker are the above SDK flags, plus `-multiply_defined suppress`.
* Flags for `strip` default to `-x`.
* Flags for the codesigning tool default to `-S`.
* The Private Framework path is defined with `$(SYSROOT)/System/Library/PrivateFrameworks`.

#### Included Common Targets

TODO.

### macosx/native (Mac OS X)

#### `TARGET` Flags

For this target, the `TARGET` variable flags that can be applied are:

* (Optional) `clang` Flag: If set to `clang`, `clang` is used as the C/C++ compiler instead of `gcc`.
* Deployment Target Flag: Defines the deployment target for the build, represented by a Mac OS X version number. If empty, no deployment target is applied.

#### Variables

Variables which define behavior of this target's configuration are:

###### ARCHS

Defines the architecture for the build.

Defaults to `i386 x86_64`.

#### Tools

Tools are found using [xcrun(1)](http://developer.apple.com/documentation/Darwin/Reference/ManPages/man1/xcrun.1.html), with parameter `-sdk macosx`. The tools are defined as follows:

* C Compiler: If `TARGET` flag `clang` was activated, `clang`. Otherwise, `gcc`.
* C++ Compiler: If `TARGET` flag `clang` was activated, `clang++`. Otherwise, `g++`.
* Linker: The C++ Compiler is used.
* Strip: Always named `strip`.
* codesign\_allocate: Found using `xcrun(1)` flag `-find codesign_allocate`.
* codesign: None.

#### Flags

Regarding the flags of building tools as specified by the target:

* Flags for the compiler are `-arch <architecure>` for each defined architecure, and `-mmacosx-version-min=<deployment target>` for the deployment target.
* Flags for the linker are the same as the compiler ones, plus `-multiply_defined suppress`.
* Flags for `strip` default to `-x`.
* The Private Framework path is defined as `/System/Library/PrivateFrameworks`.

#### Included Common Targets

??

### simulator (iPhone Simulator)

#### `TARGET` flags

For this target, the `TARGET` variable flags that can be applied are:

* (Optional) `clang` Flag: If set to `clang`, `clang` is used as the C/C++ compiler instead of `gcc`.
* SDK Version Flag: Defines the SDK version for the build. If empty or set to `latest`, defaults to the latest SDK version found.
* Deployment Target Flag: Defines the deployment target for the build, represented by an iPhone OS version number. If empty, defaults to `3.0`.

#### Variables

Variables which define behavior of this target's configuration are:

###### SYSROOT

Defines the system root for the build.  
Should only be used if there is no way of letting Theos track the SDK traditionally.

Defaults to the `$(THEOS_PLATFORM_SDK_ROOT)/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneSimulator<sdkversion>.sdk`.

###### ARCHS

Defines the architecture for the build.

Defaults to `i386`.

###### IPHONE\_SIMULATOR\_ROOT

Defines the root directory of the simulator OS. Is required for installs.

Defaults to empty.

#### Tools

Tools are found using [xcrun(1)](http://developer.apple.com/documentation/Darwin/Reference/ManPages/man1/xcrun.1.html), with parameter `-sdk iphoneos`. The tools are defined as follows:

* C Compiler: If `TARGET` flag `clang` was activated, `clang`. Otherwise, `gcc`.
* C++ Compiler: If `TARGET` flag `clang` was activated, `clang++`. Otherwise, `g++`.
* Linker: The C++ Compiler is used.
* Strip: Always named `strip`.
* codesign\_allocate: Found using `xcrun(1)` flag `-find codesign_allocate`.
* codesign: No tool is assigned.

#### Flags

Regarding the flags of building tools as specified by the target:

* SDK flags are:
	* `-arch <architecure>` for each defined architecure
	* `-isysroot <sysroot>` for the system root
	* `-D__IPHONE_OS_VERSION_MIN_REQUIRED=__IPHONE_<deployment target>` for the deployment target
	* `-mmacosx-version-min=<osx deployment target>, where it is `10.6` if the target SDK version >= 4.0, and `10.5` if otherwise

* Flags for the compiler are the above SDK flags, plus `-fobjc-abi-version=2 -fobjc-legacy-dispatch` if SDK version >= 3.2.
* Flags for the linker are `-multiply_defined suppress`, above SDK flags, plus `-Xlinker -objc_abi_version -Xlinker 2` if SDK version >= 3.2.
* Flags for `strip` default to `-x`.
* Flags for the codesigning tool default to `-S`.
* The Private Framework path is defined as `$(SYSROOT)/System/Library/PrivateFrameworks`.

#### Rules

This target overrides the following rules:

###### internal-install

(goto rules documentation)

Through the values on `IPHONE_SIMULATOR_ROOT`, installs the staging directory data into it. If it is not defined, provides an error message.

#### Included Common Targets

TODO.

## Darwin-arm (iPhone OS)

### iphone/native (iPhone OS)

### iphone (iPhone OS)

#### `TARGET` flags

No `TARGET` flags can be applied for this target.

#### Variables

Variables which define behavior of this target's configuration are:

###### SYSROOT

Defines the system root for the build.  

Defaults to `/var/sdk`.

###### SDKBINPATH

Defines the path of the SDK build tools.

Defaults to `/usr/bin`.

###### SDKTARGET

Defines the tool prefix. ([TODO] A better explanation?)

Defaults to `arm-apple-darwin9`.

#### Tools

Tools are found with the following path format:

	$(SDKBINPATH)/$(SDKTARGET)-<tool name>

The tool names are defined as follows:

* C Compiler: `gcc`.
* C++ Compiler: `g++`.
* Linker: The C++ Compiler is used.
* Strip: Always named `strip`.
* codesign\_allocate: `codesign_allocate`.
* codesign: `ldid`.

#### Flags

Regarding the flags of building tools as specified by the target:

* SDK flags are `-isysroot <system root>` for the system root.
* Flags for the compiler are the SDK flags.
* Flags for the linker are the SDK flags, plus `-multiply_defined suppress`.
* Flags for `strip` default to `-x`.
* Flags for the codesigning tool default to `-S`.
* The Private Framework path is defined as `$(SYSROOT)/System/Library/PrivateFrameworks`.

#### Included Common Targets

TODO.

