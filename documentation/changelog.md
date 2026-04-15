# Changelog

## 2026-04-15
- Reworked `DynamicColor` into an explicit dual-appearance token that stays usable as a SwiftUI `ShapeStyle`.
- Switched `DynamicColor` to store packed hex color values directly and resolve platform colors separately for SwiftUI and UIKit.
- Added a packed `DynamicColor.HexValue` model so alpha-bearing colors can be represented with one value per appearance instead of split color and alpha parameters.
- Added explicit SwiftUI and UIKit resolution APIs so the same semantic color token can be consumed in both frameworks without routing UIKit through SwiftUI.
- Removed misleading light-only convenience helpers from `DynamicColor` so appearance behavior is always explicit.
- Reworked `FontStyle` to store semantic `FontToken` values instead of prebuilt SwiftUI fonts so typography can resolve cleanly for SwiftUI and UIKit from the same definition.
- Moved the default palette, typography, spacing, and shadow presets into the token-group types to make styleguide authoring more direct and maintainable.
- Replaced the branded default preset with a neutral library baseline and aligned the spacing defaults with the bundled preset.
