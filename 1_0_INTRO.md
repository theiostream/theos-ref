# Introduction

**Theos** (formerly iphone-framework) is a set of Makefiles designed to take away the complexity of building and organizing iPhoneOS projects without the use of Xcode (or even Mac OS X).

Theos is developed mainly by Dustin Howett (DHowett) and maintained on [**Git**](http://github.com/DHowett/theos/) (primarily) and on [Subversion](http://svn.howett.net/svn/theos/).

Theos features a robust build system driven by [**GNU Make**](http://www.gnu.org/software/make/), which makes its Makefiles easily readable and deployable through everywhere with simple Theos and Make installs.

As simple as `git clone git://github.com/DHowett/theos`, Theos's installation is designed to be portable and easy. One of Theos' principles was to never require any extra bootstrapping step.

Theos also features a set of other components such as [**Logos**](http://iphonedevwiki.net/index.php/Logos) and [**NIC**](http://theos.howett.net/nic), which are documented elsewhere. This document regards Theos' Makefile system.

## Conceptual Notes
A **project** refers to a root folder with a Theos Makefile and files related to it, and its subprojects.

Theos Makefiles are written in Make. Therefore any sort of Make syntax IS valid, such as rules, variable definitions, etc. Theos has its built-in setable variables and rules which will be documented further in this document, but nothing implies that only these should be used.

For a (very) in-through reference on Make, check the [Make manual](http://www.gnu.org/software/make/manual/make.html).