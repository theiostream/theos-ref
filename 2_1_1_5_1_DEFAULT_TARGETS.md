# Theos Targets

This document pertains to:

* Documentation of the functionality from default Theos targets.

This document will be divided between targets by platform. When documented, `TARGET` variable flags will always start at the second flag (that is, disregarding the target specifier).

## Darwin (OSX)

### iphone (iPhone OS)

For this target, the `TARGET` variable flags that can be applied are:

* (Optional) `clang` Flag: If set to `clang`, `clang` is used as the C/C++ compiler instead of `gcc`.
* SDK Version Flag: Defines the SDK version for the build. If empty, defaults to the latest SDK version found.
* Deployment Target Flag: Defines the deployment target for the build, represented by an iPhone OS version number. If empty, defaults to `3.0`.

The following variables also define behavior for this target:

###### SYSROOT

Defines the system root for the build.

Defaults to the `$(THEOS_PLATFORM_SDK_ROOT)/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS<version>.sdk`.

###### ARCHS

Defines the architecture for the build.
It is not recommended to set this variable, since Theos will attempt to optimize the supported architectures based on the defined deployment target and SDK version.

Defaults to:

* If SDK version is >= 6.0 and deployment target is < 4.3, `armv7`;
* If SDK version is >= 6.0 and deployment target is >= 4.3, `armv7 armv7s`;
* If SDK version is < 6.0, and deployment target is >= 3.0, `armv6 armv7`;
* If SDK version is < 6.0, and deployment target is < 3.0, `armv6`.

Tools are found using [xcrun(1)](http://developer.apple.com/documentation/Darwin/Reference/ManPages/man1/xcrun.1.html), with parameter `-sdk iphoneos`. The tools are defined as follows:

* C Compiler: If `TARGET` flag `clang` was activated, `clang`. Otherwise, `gcc`.
* C++ Compiler: If `TARGET` flag `clang` was activated, `clang++`. Otherwise, `g++`.
* Linker: The C++ Compiler is used.
* Strip: Always named `strip`.
* codesign\_allocate: Found using `xcrun(1)` flag `-find codesign_allocate`.
* codesign: `ldid`.

* Flags for `strip` default to `-x`.
* Flags for the codesigning tool default to `-S`.  
For information regarding changing these settings, refer to [Stripping/Codesigning Variables](./2_1_1_3_STRIPPING_CODESIGNING.md)
