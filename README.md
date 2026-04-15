# Styleguide

`Styleguide` is an iOS Swift package for defining semantic colors, fonts, spacing, and shadows in one place, then using those same styles from SwiftUI and UIKit.

The package is intentionally narrow:

- We define a `Styleguide` once.
- We inject it into SwiftUI through the environment.
- We use the same semantic tokens from UIKit through contextual type inference.

Our public surface is deliberately small. There is no public default theme; consumers are expected to define their own `Styleguide`.

## Requirements

- iOS 26+
- Swift 6.2+
- Xcode with Swift Package Manager support

## Installation

### Xcode

1. Open our app project in Xcode.
2. Choose `File > Add Package Dependencies...`
3. Enter:

```text
https://github.com/benboecker/Styleguide.git
```

4. Add the `Styleguide` library product to the target that needs it.

### Package.swift

The repository does not currently expose tagged releases, so use `branch: "main"` for now:

```swift
dependencies: [
	.package(url: "https://github.com/benboecker/Styleguide.git", branch: "main")
],
targets: [
	.target(
		name: "AppFeature",
		dependencies: [
			.product(name: "Styleguide", package: "Styleguide")
		]
	)
]
```

If we later publish version tags, prefer a version requirement over a branch requirement.

## Public Model

We build a styleguide from four semantic groups:

- `Styleguide.ColorStyle`
- `Styleguide.FontStyle`
- `Styleguide.Spacing`
- `Styleguide.Shadows`

Those groups are only for constructing the styleguide. Once we have a `Styleguide`, we use it through dynamic members:

- `styleguide.foregroundPrimary`
- `styleguide.headline2`
- `styleguide.medium`
- `styleguide.large`

Depending on type context, the same member can resolve differently:

- `styleguide.accentPrimary` can be a `DynamicColor` or a `UIColor`
- `styleguide.headline2` can be a `Font` or a `UIFont`
- `styleguide.large` is a `Styleguide.Shadow`

## Creating A Styleguide

We create one semantic styleguide for the app and keep it close to the app entry point:

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
	spacing: Styleguide.Spacing(
		extraSmall: 4,
		small: 8,
		medium: 16,
		large: 24,
		extraLarge: 32
	),
	shadows: Styleguide.Shadows(
		small: Styleguide.Shadow(
			color: DynamicColor(light: "0000001F", dark: "00000000"),
			radius: 4,
			offset: 2
		),
		large: Styleguide.Shadow(
			color: DynamicColor(light: "00000026", dark: "00000000"),
			radius: 12,
			offset: 4
		)
	)
)
```

## SwiftUI

### Inject The Styleguide

The package exposes `EnvironmentValues.styleguide`, so we usually inject our styleguide once near the app root:

```swift
import SwiftUI
import Styleguide

@main
struct ExampleApp: App {
	var body: some Scene {
		WindowGroup {
			RootView()
				.environment(\.styleguide, appStyleguide)
		}
	}
}
```

### Read And Apply Styles

In SwiftUI, `DynamicColor` already conforms to `ShapeStyle`, so we can use color tokens directly in `foregroundStyle`, `background`, `fill`, and related APIs.

```swift
import SwiftUI
import Styleguide

struct DashboardView: View {
	@Environment(\.colorScheme) private var colorScheme
	@Environment(\.styleguide) private var styleguide

	var body: some View {
		let cardShadow: Styleguide.Shadow = styleguide.small

		VStack(alignment: .leading, spacing: styleguide.medium) {
			Text("Weekly summary")
				.font(styleguide.headline2)
				.foregroundStyle(styleguide.foregroundPrimary)

			Text("One semantic style source for both frameworks.")
				.font(styleguide.body1)
				.foregroundStyle(styleguide.foregroundSecondary)
		}
		.padding(styleguide.large)
		.background(styleguide.backgroundSecondary, in: .rect(cornerRadius: 24))
		.shadow(
			color: cardShadow.color.resolvedColor(for: colorScheme),
			radius: cardShadow.radius,
			y: cardShadow.offset
		)
	}
}
```

### SwiftUI Notes

- `styleguide.headline2` resolves to `Font`
- `styleguide.foregroundPrimary` resolves to `DynamicColor`
- `styleguide.medium` resolves to `CGFloat`
- `styleguide.small` / `styleguide.large` resolve to `Styleguide.Shadow`

If we need the token explicitly, add a type annotation:

```swift
let accentToken: DynamicColor = styleguide.accentPrimary
let shadow: Styleguide.Shadow = styleguide.large
```

### Previews

```swift
#Preview {
	DashboardView()
		.environment(\.styleguide, appStyleguide)
}
```

## UIKit

UIKit uses the same dynamic members. The call site decides whether Swift should resolve a font or color as a UIKit type.

```swift
import UIKit
import Styleguide

final class DashboardViewController: UIViewController {
	private let titleLabel = UILabel()
	private let subtitleLabel = UILabel()
	private let actionButton = UIButton(type: .system)

	private let styleguide: Styleguide

	init(styleguide: Styleguide) {
		self.styleguide = styleguide
		super.init(nibName: nil, bundle: nil)
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = styleguide.backgroundPrimary
		titleLabel.font = styleguide.headline2
		titleLabel.textColor = styleguide.foregroundPrimary
		subtitleLabel.font = styleguide.body1
		subtitleLabel.textColor = styleguide.foregroundSecondary
		actionButton.tintColor = styleguide.accentPrimary
	}
}
```

### UIKit Notes

- `view.backgroundColor = styleguide.backgroundPrimary` resolves to `UIColor`
- `label.font = styleguide.body1` resolves to `UIFont`
- If there is no destination type, annotate explicitly:

```swift
let accentColor: UIColor = styleguide.accentPrimary
let titleFont: UIFont = styleguide.headline2
let accentToken: DynamicColor = styleguide.accentPrimary
```

UIKit shadow application is still manual on purpose:

```swift
let shadow: Styleguide.Shadow = styleguide.large
layer.shadowRadius = shadow.radius
layer.shadowOffset = CGSize(width: 0, height: shadow.offset)
```

If we also want to bridge the shadow color into UIKit, we currently do that explicitly in app code:

```swift
import SwiftUI

let shadow: Styleguide.Shadow = styleguide.large
let scheme: ColorScheme = traitCollection.userInterfaceStyle == .dark ? .dark : .light

layer.shadowColor = UIColor(shadow.color.resolvedColor(for: scheme)).cgColor
```

## Transparent And Clear Colors

There is one important edge case in the color API.

Numeric initializers treat values up to `0xFFFFFF` as opaque `RRGGBB`. That means this is **not** a clear color:

```swift
let notClear = DynamicColor(light: 0x00000000)
```

Swift drops the leading zeroes in the numeric literal, so the initializer sees `0x000000`, which is opaque black.

For fully transparent colors, or any `RRGGBBAA` value with leading zeroes in the alpha channel, use the string initializer instead:

```swift
let clear = DynamicColor(light: "00000000", dark: "00000000")
let softShadow = DynamicColor(light: "0000001F", dark: "00000000")
```

This is the safest rule:

- Use numeric literals for opaque colors like `0x2563EB`
- Use strings for transparent colors like `"00000000"` or `"0000001F"`

## Repository Docs

Additional project notes live in:

- [`documentation/using-styleguide.md`](documentation/using-styleguide.md)
- [`documentation/changelog.md`](documentation/changelog.md)

As Gandalf would put it: “All we have to decide is what to do with the time that is given us.” In our case, we use it to stop scattering raw style values across the app.
