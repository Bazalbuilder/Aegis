# Aegis Contribution Guide
Thanks for considering contributing to Aegis! This guide details a few tips and guidelines to make contributing a piece of cake.

## Bug Reports
Any bugs (or things that look like bugs) should be reported to the [Issue Tracker](https://github.com/Bazalbuilder/Aegis/issues) so we can fix these issues.

When posting an issue, make sure to double-check to see if another person has already posted that issue. If it is, don't worry; if we notice a duplicate issue, we'll send you the original issue's link.

## Feature Requests
If there are any feature requests that you think would add a valuable addition, you can post a request on the [Issue Tracker](https://github.com/Bazalbuilder/Aegis/issues).

Just like bug reports, double check to see if there is a duplicate before opening a new feature request.

Please note, I am not the smartest individual out there, so you may have to describe what you want to implement to the repository.

## Working on Aegis

To get started working on Aegis, you'll need the following installed on your device:
* [Lua 5.1](https://www.lua.org/ftp/)
* [LuaCov](https://github.com/lunarmodules/luacov)
* [Foreman](https://github.com/Roblox/foreman) ([installation instructions](https://github.com/Roblox/foreman#installation))
* [Selene](https://github.com/kampfkarren/selene) (install via foreman; `foreman install` or download latest release)
* [StyLua](https://github.com/JohnnyMorganz/StyLua) (install only once via foreman; `foreman install` or downlaod latest release)

If you are on a Windows machine, then you may have to edit your 'PATH' variables (environmental variables) to include the file directory of both Selene and StyLua (if it is not included already).

To generate a LuaCov coverage report:

```sh
lua -lluacov bin/spec.lua
luacov
```

More information will be added later.

## Documentation
There is currently no documentation for Aegis. 

If you wish to help with setting up documentation, feel free to contact me on [Discord](https://discord.gg/asCWGUfJMj).

## Pull Requests
Before starting a pull request, open a feature request or a bug. This helps us prevent duplicated and wasted effort.

Before you submit a pull request, check:
* Code Style: Double-check your code while using [StyLua](https://github.com/JohnnyMorganz/StyLua) to ensure it follows the [official Roblox Lua style guide](https://roblox.github.io/lua-style-guide).
* Linting: You can use [Selene](https://github.com/kampfkarren/selene) on your code to check for any issues; there should not be any warnings.
* Tests: Make sure your code is tested with no failures.
* Changelog: Don't forget to add an entry to [CHANGELOG.md](CHANGELOG.md) before submitting a pull request.

More information on how to use Selene and StyLua are shown below.

### Code Style
Roblox has an official Lua style guide, which you can find [here](https://roblox.github.io/lua-style-guide), which should be the general guidelines for all new code. Contributors should also follow this while modifying existing code.

In short:
* Tabs for indentation
* Double quotes
* One statement per line

Use 'StyLua' to format your code in accordance to the Roblox style guide.

### Selene and StyLua
Selene and StyLua are used in this project for static analysis.

Make sure to install Foreman and run `foreman install` first, which will make both Selene and StyLua available for you.

### Changelog
Every pull request should include an entry in [CHANGELOG.md](CHANGELOG.md). This should include the pull request number, a short description of the changes, and the author.

Add a line under the "Current master" heading. When we make a new release, we'll move all the entries in the changelog to a new heading, with the version number.

You don't need to link the related GitHub issue in the changelog, as pull requests will also link to them.

### Tests
When submitting a bug fix, include a test that verifies the broken behavior and that the bug fix does work. This helps us avoid regressions.

When submitting a new feature, add tests for all functionality.