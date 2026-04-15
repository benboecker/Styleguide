# Using Styleguide

This document complements the repository [`README.md`](../README.md) with a shorter API-focused summary.

## Constructing A Styleguide

The public constructor takes four semantic groups:

- `Styleguide.FontStyle`
- `Styleguide.ColorStyle`
- `Styleguide.Spacing`
- `Styleguide.Shadows`

There is no public default preset. Consumers are expected to construct a `Styleguide` explicitly and inject it into the app.

## SwiftUI Consumption

Inject the styleguide through `EnvironmentValues.styleguide`:

```swift
RootView()
	.environment(\.styleguide, appStyleguide)
```

Read it from the environment and use the dynamic members directly:

```swift
@Environment(\.colorScheme) private var colorScheme
@Environment(\.styleguide) private var styleguide

let shadow: Styleguide.Shadow = styleguide.small

Text("Weekly summary")
	.font(styleguide.headline2)
	.foregroundStyle(styleguide.foregroundPrimary)
	.padding(styleguide.medium)
	.background(styleguide.backgroundSecondary, in: .rect(cornerRadius: 24))
	.shadow(
		color: shadow.color.resolvedColor(for: colorScheme),
		radius: shadow.radius,
		y: shadow.offset
	)
```

## UIKit Consumption

UIKit uses the same members, resolved through type context:

```swift
view.backgroundColor = styleguide.backgroundPrimary
titleLabel.font = styleguide.headline2
subtitleLabel.textColor = styleguide.foregroundSecondary
```

If there is no destination type, add one explicitly:

```swift
let accentColor: UIColor = styleguide.accentPrimary
let accentToken: DynamicColor = styleguide.accentPrimary
let shadow: Styleguide.Shadow = styleguide.large
```

## Transparent Color Edge Case

Numeric initializers treat values up to `0xFFFFFF` as opaque `RRGGBB`, so `DynamicColor(light: 0x00000000)` is not clear.

For fully transparent colors, or any `RRGGBBAA` value with leading zeroes, use the string initializer:

```swift
let clear = DynamicColor(light: "00000000", dark: "00000000")
let softShadow = DynamicColor(light: "0000001F", dark: "00000000")
```
