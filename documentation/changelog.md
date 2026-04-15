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
- Added `Styleguide.uiKit` as a UIKit convenience namespace so app code can resolve semantic color and font roles to `UIColor` and `UIFont` without bypassing the grouped token model.
- Clarified the public typography access split so `Styleguide` keeps terse SwiftUI font shorthand while `fonts` remains the richer token-based access path.
- Added contextual dynamic-member overloads on `Styleguide` itself so UIKit code can resolve `UIColor` and `UIFont` directly from the same shorthand when the receiving API provides the target type.
