# Contributing to Aegis, 1st Edition
If you want to help with Aegis' development, here's a few tips and guidelines to make contributing a piece of cake.

## Bug Reports
Any bugs (or things that look like bugs) should be reported on the [Issue Tracker](https://github.com/Bazalbuilder/Aegis/issues) so we can fix these issues.

When posting an issue, make sure to double check to see if that issue has been posted already by another person. If it is, don't worry; if we notice a duplicate issue, we'll send you the original issue's link.

## Feature Requests
If there are any feature requests that you think would help with Aegis' development, you can post a request on the the [Issue Tracker](https://github.com/Bazalbuilder/Aegis/issues).

Just like bug reports, double check to see if there is a duplicate before opening a new feature request.

Do note, I am not the smartest individual out there, so you may have to describe what you want to implement to the repository.

## Documentation
There is currently no documentation for Aegis. If you wish to help with setting up documentation, feel free to contact me on [Discord](https://discord.gg/asCWGUfJMj).

## Pull Requests
Before starting a pull request, open a feature request or a bug. This helps us prevent duplicated and wasted effort.

Before you submit a pull request, check:
* Code Style: Make sure your code to ensure it follows the [official Roblox Lua style guide](https://roblox.github.io/lua-style-guide).
* Linting: There should be no warnings. If you are skeptical if your code has any warnings, put '--1strict' at the top of your code to enable type checking.
* Tests: Make sure your code is tested with no failures.
* Changelog: Don't forget to add an entry to [CHANGELOG.md](CHANGELOG.md).

If you want to fork this repository, be my guest. Just make sure to credit me (Bazalbuilder) when forking, and make sure that your fork is also licensed under MIT.

### Code Style
Roblox has an official Lua style guide, which you can find [here](https://roblox.github.io/lua-style-guide), which should be the general guidelines for all new code. Developers should also follow this when modifying code.

In short:
* Tabs for indentation
* Double quotes
* One statement per line

Use 'StyLua' (instructions below) to format your code in accordance to the Roblox style guide.

### Changelog
Every pull request should include an entry in [CHANGELOG.md](CHANGELOG.md). This should include the pull request number, a short description of the changes, and the author.

Add a line under the "Current master" heading. When we make a new release, we'll move all the entries in the changelog to a new heading, with the version number.

You don't need to link the related GitHub issue in the changelog, as pull requests will also link to them.

### Tests
When submitting a bug fix, include a test that verifies the broken behavior and that the bug fix does work. This helps us avoid regressions.

When submitting a new feature, add tests for all functionality.