# Changelog

## 2026-04-15
- Reworked `DynamicColor` into an explicit dual-appearance token that stays usable as a SwiftUI `ShapeStyle`.
- Switched `DynamicColor` to store parsed hex color data directly and resolve platform colors separately for SwiftUI and UIKit.
- Collapsed public dynamic color construction onto `DynamicColor` initializers so 6-digit and 8-digit hex values can be passed directly without exposing the packed helper type.
- Added public string-based `DynamicColor` initializers so leading-zero alpha colors can still be expressed exactly when needed.
- Renamed the internal dynamic color helper to `HexColor` and changed it to store decomposed RGBA components instead of packed bytes.
- Added explicit SwiftUI and UIKit resolution APIs so the same semantic color token can be consumed in both frameworks without routing UIKit through SwiftUI.
- Removed misleading light-only convenience helpers from `DynamicColor` so appearance behavior is always explicit.
- Reworked `FontStyle` to store semantic `FontToken` values instead of prebuilt SwiftUI fonts so typography can resolve cleanly for SwiftUI and UIKit from the same definition.
- Moved the default palette, typography, spacing, and shadow presets into the token-group types to make styleguide authoring more direct and maintainable.
- Replaced the branded default preset with a neutral library baseline and aligned the spacing defaults with the bundled preset.
- Clarified the public typography access split so `Styleguide` keeps terse SwiftUI font shorthand while `fonts` remains the richer token-based access path.
- Added contextual dynamic-member overloads on `Styleguide` itself so UIKit code can resolve `UIColor` and `UIFont` directly from the same shorthand when the receiving API provides the target type.
- Replaced the placeholder showcase with a maintained `StyleguideShowcaseView` that demonstrates token definition plus SwiftUI and UIKit consumption.
- Moved the SwiftUI environment and preview helpers out of `Styleguide.swift` into dedicated source files so the core type owns only the semantic model and shorthand accessors.
- Tightened access control across the package so grouped storage, presets, showcase helpers, and token internals stay hidden unless they are required to construct a `Styleguide` or use a public subscript result.
- Added macOS 14 support in the package manifest so the library can build for iOS and macOS from the same target.
- Reworked the native platform bridges so `DynamicColor` and `FontToken` resolve `UIColor` and `UIFont` on UIKit platforms, and `NSColor` and `NSFont` on macOS.
