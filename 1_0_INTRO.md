# Introduction

**Theos** (formerly iphone-framework) is a set of Makefiles designed to take away the complexity of building and organizing iPhoneOS projects without the use of Xcode (or even Mac OS X).

Theos is developed mainly by Dustin Howett (DHowett) and available via [**Git**](http://github.com/DHowett/theos/) and [Subversion](http://svn.howett.net/svn/theos/).

Theos features a robust build system driven by [**GNU Make**](http://www.gnu.org/software/make/), which makes its Makefiles easily-read, concise, and extensible.

Getting started is as simple as `git clone git://github.com/DHowett/theos`: Theos's installation is designed to be easy and portable. One of Theos' principles was to never require any bootstrapping.

Theos also features a set of other components such as [**Logos**](http://iphonedevwiki.net/index.php/Logos) and [**NIC**](http://theos.howett.net/nic), which are documented elsewhere. This document will focus on Theos' Makefile system.

## Conceptual Notes
A **project** refers to a directory hierarchy containing a Theos Makefile, related files and subprojects.

Theos Makefiles are written in *make* (specifically, *GNU make*). As such, all Make syntax is valid, including rules, variable definitions, and so forth. Theos provides built-in variables and rules (herein documented), but can be side-stepped and expanded wherever necessary.

For a (very) in-depth reference on Make, check the [GNU `make' manual](http://www.gnu.org/software/make/manual/make.html).
