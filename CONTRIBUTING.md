# Aegis Contribution Guide
Thanks for considering contributing Aegis! This document will help you get started with contributing to the Aegis project.

## Bug Reports
Any bugs (or things that look like bugs) should be reported to the [GitHub Issue Tracker](https://github.com/Bazalbuilder/Aegis/issues).

Please include as much information as possible, including:
* The version of Aegis you are using
* Steps to reproduce the bug
* Any relevant error messages or output
* If applicable, a screenshot or video demonstrating the bug

When posting an issue, make sure to double-check that it hasn't already been reported. If one's already posted, don't worry! If we notice a duplicate issue, we'll send you the link to the original issue.

## Feature Requests
Any feature requests or feedback that you think would make a difference should be posted to the [GitHub Issue Tracker](https://github.com/Bazalbuilder/Aegis/issues) or our [[Discord server](https://discord.gg/asCWGUfJMj).

Please include as much information as possible, including:
* A clear description of the feature you're requesting
* Any relevant use cases or examples of how the feature would be used
* Any existing alternatives or workarounds you've considered
* If applicable, any relevant references or links to existing documentation or implementations.

Like bug reports, please double-check that the feature you're requesting hasn't already been posted.

## Working on Aegis
To get started working on Aegis, you'll need the following programs installed on your device:
* [Lua 5.1](https://www.lua.org/ftp/)
* [LuaCov](https://keplerproject.github.io/luacov) `luarocks install luacov`, support being added soon
* [Foreman](https://github.com/Roblox/foreman) ([installation instructions](https://github.com/Roblox/foreman#installation))
* [Selene](https://github.com/kampfkarren/selene) (install via foreman; `foreman install` or download latest release)
* [StyLua](https://github.com/JohnnyMorganz/StyLua) (install only once via foreman; `foreman install` or downlaod latest release)

We also recommend installing the following programs, but it is not required:
* [Visual Studio Code](https://code.visualstudio.com/)
* [Rojo](https://github.com/rojo-rbx/rojo)

**NOTE:** If you are on a Windows machine, then you may have to edit your `PATH` variables (environmental variables) to include the file directory for the programs listed above, if they aren't listed already.

## Documentation
There is currently no documentation at the moment, as most of the features are in development phase.

## Pull Requests
Before starting a pull request, open an issue abut the feature or bug. This helps us prevent duplicated and wasted effort. These issues are a great place to ask for help if you run into problems.

Before you submit a new pull request, check:
* Linting: Run `selene src` to check for any issues. No warnings allowed!
* Formatting: Run `stylua src` to format all code.
* Tests: All tests need to pass before we can merge your PR to the `main` branch.
* Update: Make sure that your branch is up-to-date with the `main` branch.
* Coverage: Code coverage of tests should not decrease.

### Code Style
Roblox has an official Lua style guide, which you can find [here](https://roblox.github.io/lua-style-guide), which should be the general guidelines for all new code. Contributors should also follow this while modifying existing code.

Use StyLua ("stylua src`) to format your code in accordance to the Roblox Style Guide.

### Linting
Aegis uses [Selene](https://github.com/kampfkarren/selene) to check for any issues with our code. 

Selene is a static code analysis tool that checks for common errors and bad practices in Lua code.

### Changelog
All notable changes to Aegis should be documented in the [CHANGELOG.md](https://github.com/Bazalbuilder/Aegis/blob/main/CHANGELOG.md) file.

Add a line under the "Nightly Releases" heading. When we make a new release, all of the bullet points under "Nightly Releasees" will be attached to a new version.

### Testing
When submitting a bug report, create a test that verifies the broken behavir and that the bug fix works. This helps us avoid regresions!

When submitting a new feature, add tests for all functionality.