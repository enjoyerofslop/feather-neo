# Feather neo

> [!NOTE]
> Feather neo is an unofficial fork of [Feather](https://github.com/claration/Feather) by [Samara](https://github.com/claration) and contributors. It is not affiliated with or endorsed by Feather's developers. For official builds and support, go to the [original repository](https://github.com/claration/Feather).

Feather neo is Feather, a sideloading app for developer certificates, built for iPhone Duo.

## What's different from Feather

**iPhone Duo support**
- Built with the iOS 27.1 SDK, so the app reaches the screen edge on both displays and navigation and tab bars sit vertically beside the status column.
- The sidebar opens by default in regular width, such as on the inner display.
- Landscape works on iPhone, for the outer display's tent pose.
- Screenshots on app pages are sized to the window rather than `UIScreen.main`, which is ambiguous with two displays and wrong in Split View.
- The reset confirmation picks an alert or action sheet by size class. Before, an unanchored action sheet could crash in regular width.
- Alerts are presented from the active scene's window rather than the deprecated cross-scene `keyWindow`.

**Rebranding**
- Display name "Feather neo" and bundle ID `com.enjoyerofslop.FeatherNeo`, so it installs alongside Feather.
- A `featherneo://` URL scheme in addition to `feather://`. LocalDevVPN calls back to `featherneo://`, so it returns to this app when Feather is also installed.
- Settings and About link to this repository. About says the app is a fork and keeps the credits for Feather's developers.
- The donation prompts, sponsor list, GitHub star prompt and the AltStore source (`app-repo.json`) are removed, since they were for the original app.

## Features

These come from Feather:

- Sign and install applications.
- Supports [AltStore](https://faq.altstore.io/distribute-your-apps/make-a-source#apps) repositories.
- View detailed information about apps and your certificates.
- Configurable signing options for modifying apps, such as appearance and Files app support, including patching apps for compatibility and Liquid Glass.
- Tweak support for advanced users, using [ElleKit](https://github.com/tealbathingsuit/ellekit) for injection. Supports injecting `.deb` and `.dylib` files.
- No tracking or analytics.

## Building from source

There are no prebuilt releases. To build it yourself you need Xcode 27.1 with the iOS 27.1 SDK, which the iPhone Duo layout depends on.

1. Clone the repository with its submodules:
   ```sh
   git clone --recursive https://github.com/enjoyerofslop/feather-neo
   ```
2. Open `Feather.xcworkspace` (not the `.xcodeproj`).
3. In the Feather target's Signing & Capabilities, choose your own team and change `FEATHER_PRODUCT_BUNDLE_IDENTIFIER` in `Feather.xcconfig` to an ID you own. Debug builds append your team ID to the bundle ID.
4. Build and run the `Feather` scheme on your device.

`make` builds an unsigned `.ipa` into `packages/`, the same way Feather's release workflow does.

## Translating

Localizations are in `Feather/Resources/Localizable.xcstrings`. Strings added in this fork are English only for now.

## Acknowledgements

- [Samara](https://github.com/claration) - The maker of Feather
- [idevice](https://github.com/jkcoxson/idevice) - Backend for builds with this included, used for communication with `installd`.
- [*.backloop.dev](https://backloop.dev/) - localhost with public CA signed SSL certificate
- [Vapor](https://github.com/vapor/vapor) - A server-side Swift HTTP web framework.
- [Zsign](https://github.com/zhlynn/zsign) - Allowing to sign on-device, reimplemented to work on other platforms such as iOS.
- [LiveContainer](https://github.com/LiveContainer/LiveContainer) - Fixes/some help
- [Nuke](https://github.com/kean/Nuke) - Image caching.
- [Asspp](https://github.com/Lakr233/Asspp) - Some code for setting up the http server.
- [plistserver](https://github.com/nekohaxx/plistserver) - Hosted on https://api.palera.in.

## License

Feather is licensed under the GPL-3.0 license, and so is this fork. See [LICENSE](../LICENSE). Feather is copyright (c) 2024 Samara M. This fork has been modified from Feather since October 2026; the git history records every change.

AltSourceKit, NimbleKit and Zsign are MIT licensed.
