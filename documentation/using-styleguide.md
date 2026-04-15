# Using Styleguide

`Styleguide` is built around two jobs:

1. Define semantic colors, fonts, spacing, and shadows in one place.
2. Consume those same tokens directly from SwiftUI and UIKit code.

## Define A Custom Styleguide

Start by creating the four semantic groups, then compose them into one `Styleguide` value:

```swift
import Styleguide

let appStyleguide = Styleguide(
	fonts: Styleguide.FontStyle(
		headline1: Styleguide.FontToken(size: 34, textStyle: .largeTitle, weight: .bold),
		headline2: Styleguide.FontToken(size: 22, textStyle: .title3, weight: .semibold),
		headline3: Styleguide.FontToken(size: 17, textStyle: .headline, weight: .semibold),
		headline4: Styleguide.FontToken(size: 14, textStyle: .callout, weight: .semibold),
		body1: Styleguide.FontToken(size: 17, textStyle: .body),
		body2: Styleguide.FontToken(size: 14, textStyle: .callout),
		caption1: Styleguide.FontToken(size: 12, textStyle: .caption1, weight: .medium),
		caption2: Styleguide.FontToken(size: 11, textStyle: .caption2, weight: .medium)
	),
	colors: Styleguide.ColorStyle(
		foregroundPrimary: DynamicColor(light: 0x111827, dark: 0xF9FAFB),
		foregroundSecondary: DynamicColor(light: 0x4B5563, dark: 0xD1D5DB),
		foregroundTertiary: DynamicColor(light: 0x6B7280, dark: 0x9CA3AF),
		backgroundPrimary: DynamicColor(light: 0xFFFFFF, dark: 0x111827),
		backgroundSecondary: DynamicColor(light: 0xF3F4F6, dark: 0x1F2937),
		backgroundTertiary: DynamicColor(light: 0xE5E7EB, dark: 0x374151),
		accentPrimary: DynamicColor(light: 0x2563EB, dark: 0x60A5FA),
		accentSecondary: DynamicColor(light: 0xDBEAFE, dark: 0x1E3A8A),
		accentTertiary: DynamicColor(light: 0x1D4ED8, dark: 0xBFDBFE),
		confirmation: DynamicColor(light: 0x15803D, dark: 0x4ADE80),
		warning: DynamicColor(light: 0xB45309, dark: 0xFBBF24),
		error: DynamicColor(light: 0xB91C1C, dark: 0xF87171)
	),
	spacing: Styleguide.Spacing(extraSmall: 4, small: 8, medium: 16, large: 24, extraLarge: 32),
	shadows: Styleguide.Shadows(
		small: Styleguide.Shadow(color: DynamicColor(light: "0000001F", dark: "00000000"), radius: 4, offset: 2),
		large: Styleguide.Shadow(color: DynamicColor(light: "00000026", dark: "00000000"), radius: 12, offset: 4)
	)
)
```

## Use In SwiftUI

Inject the styleguide into the environment once, then read it where views need styling:

```swift
import SwiftUI
import Styleguide

struct DashboardView: View {
	@Environment(\.colorScheme) private var colorScheme
	@Environment(\.styleguide) private var styleguide

	var body: some View {
		let shadow = styleguide.shadows.small

		VStack(alignment: .leading, spacing: styleguide.medium) {
			Text("Weekly summary")
				.font(styleguide.headline2)
				.foregroundStyle(styleguide.foregroundPrimary)

			Text("Style tokens stay semantic in view code.")
				.font(styleguide.body1)
				.foregroundStyle(styleguide.foregroundSecondary)
		}
		.padding(styleguide.large)
		.background(styleguide.backgroundSecondary, in: .rect(cornerRadius: 24))
		.shadow(
			color: shadow.color.resolvedColor(for: colorScheme),
			radius: shadow.radius,
			y: shadow.offset
		)
	}
}
```

For previews, inject the styleguide directly into the environment:

```swift
#Preview {
	DashboardView()
		.environment(\.styleguide, appStyleguide)
}
```

## Use In UIKit

UIKit code can stay on the same semantic model through the same dynamic-member shorthand.

```swift
let styleguide = appStyleguide

let titleFont: UIFont = styleguide.headline3
let accentColor: UIColor = styleguide.accentPrimary
button.tintColor = styleguide.accentPrimary
```

When we need the underlying semantic token instead of an immediately resolved UIKit value, use an explicit type annotation:

```swift
let accentToken: DynamicColor = styleguide.accentPrimary
let shadow: Styleguide.Shadow = styleguide.large
```
