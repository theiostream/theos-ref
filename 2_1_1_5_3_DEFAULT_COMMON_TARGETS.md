# Theos Common Targets

This document pertains to:

* Common targets available in the default Theos installation, and how they behave.

### darwin

This is the common target for all Darwin targets. It sets:

* `TARGET_EXE_EXT` to empty.
* `TARGET_LIB_EXT` to '.dylib'.
* `TARGET_LDFLAGS_DYNAMICLIB` to '-dynamiclib -install\_name "$(LOCAL\_INSTALL\_PATH)/$(1)"'.
* `TARGET_CFLAGS_DYNAMICLIB` to empty.
* `_THEOS_TARGET_ONLY_OBJCFLAGS` to '-std=c99'.
* `_THEOS_TARGET_SUPPORTS_BUNDLES` to 'true'.

### linux

This is the common target for all Linux targets. It sets:

* `TARGET_EXE_EXT` to empty.
* `TARGET_LIB_EXT` to '.so'.
* `TARGET_LDFLAGS_DYNAMICLIB` to '-shared -Wl,-soname,$(1)'.
* `TARGET_CFLAGS_DYNAMICLIB` to `-fPIC`.

### darwin\_flat\_bundle

This is the common target for all targets whose produced bundles should be flat (that is, have all files on the root directory). It sets:

* `_THEOS_TARGET_BUNDLE_INFO_PLIST_SUBDIRECTORY` to empty.
* `_THEOS_TARGET_BUNDLE_RESOURCE_SUBDIRECTORY` to empty.
* `_THEOS_TARGET_BUNDLE_BINARY_SUBDIRECTORY` to empty.

### darwin\_hierarchial\_bundle

This is the common target for all targets whose produced bundles should be hierarchial (that is, have a specific subdirectory structure). It sets:

* `_THEOS_TARGET_BUNDLE_INFO_PLIST_SUBDIRECTORY` to '/Contents'.
* `_THEOS_TARGET_BUNDLE_RESOURCE_SUBDIRECTORY` to '/Contents/Resources'.
* `_THEOS_TARGET_BUNDLE_BINARY_SUBDIRECTORY` to '/Contents/MacOS'.
