fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## Android

### android unit_test

```sh
[bundle exec] fastlane android unit_test
```

Runs unit test

### android integration_test

```sh
[bundle exec] fastlane android integration_test
```

Runs integration test

### android beta

```sh
[bundle exec] fastlane android beta
```

Submit a new beta build to Google Play

### android promote_to_production

```sh
[bundle exec] fastlane android promote_to_production
```

Promote beta track to prod

### android production

```sh
[bundle exec] fastlane android production
```

Deploy a new production build to Google Play

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
