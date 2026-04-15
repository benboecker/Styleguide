import SwiftUI

/// A maintained showcase that demonstrates how to define and consume a styleguide.
struct StyleguideShowcaseView: View {
	@Environment(\.colorScheme) private var colorScheme
	@Environment(\.styleguide) private var styleguide

	/// Creates the package showcase view.
	init() { }

	/// The showcase content that demonstrates semantic token definition and usage.
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: styleguide.extraLarge) {
				heroSection
				definitionSection
				swiftUIUsageSection
				uiKitUsageSection
				colorTokenSection
				typographySection
				scaleSection
			}
			.padding(styleguide.large)
			.frame(maxWidth: .infinity, alignment: .leading)
		}
		.background(styleguide.backgroundPrimary)
		.scrollIndicators(.hidden)
	}
}

private extension StyleguideShowcaseView {
	var heroSection: some View {
		VStack(alignment: .leading, spacing: styleguide.medium) {
			Text("Styleguide")
				.font(styleguide.headline1)
				.foregroundStyle(styleguide.foregroundPrimary)

			Text("Define semantic tokens once, then consume them directly in SwiftUI and UIKit.")
				.font(styleguide.body1)
				.foregroundStyle(styleguide.foregroundSecondary)
				.fixedSize(horizontal: false, vertical: true)

			HStack(spacing: styleguide.small) {
				showcaseBadge("Semantic Groups")
				showcaseBadge("SwiftUI Environment")
				showcaseBadge("UIKit Conversions")
			}
		}
		.padding(styleguide.large)
		.frame(maxWidth: .infinity, alignment: .leading)
		.background(styleguide.backgroundSecondary, in: .rect(cornerRadius: 28))
		.shadow(
			color: resolvedShadowColor(for: styleguide.shadows.large),
			radius: styleguide.shadows.large.radius,
			y: styleguide.shadows.large.offset
		)
	}

	var definitionSection: some View {
		showcaseSection(
			title: "Define Semantic Groups",
			description: "A styleguide stays maintainable because raw values live inside fonts, colors, spacing, and shadows."
		) {
			LazyVGrid(columns: showcaseColumns, spacing: styleguide.medium) {
				codeCard(
					title: "Styleguide",
					lines: [
						"let styleguide = Styleguide(",
						"    fonts: fonts,",
						"    colors: colors,",
						"    spacing: spacing,",
						"    shadows: shadows",
						")",
					]
				)

				codeCard(
					title: "Fonts",
					lines: [
						"let fonts = Styleguide.FontStyle(",
						"    headline1: FontToken(size: 34, textStyle: .largeTitle, weight: .bold),",
						"    body1: FontToken(size: 17, textStyle: .body),",
						"    caption2: FontToken(size: 11, textStyle: .caption2, weight: .medium)",
						")",
					]
				)

				codeCard(
					title: "Colors",
					lines: [
						"let colors = Styleguide.ColorStyle(",
						"    foregroundPrimary: DynamicColor(light: 0x111827, dark: 0xF9FAFB),",
						"    accentPrimary: DynamicColor(light: 0x2563EB, dark: 0x60A5FA),",
						"    error: DynamicColor(light: 0xB91C1C, dark: 0xF87171)",
						")",
					]
				)

				codeCard(
					title: "Spacing & Shadows",
					lines: [
						"let spacing = Styleguide.Spacing(extraSmall: 4, small: 8, medium: 16, large: 24, extraLarge: 32)",
						"let shadows = Styleguide.Shadows(",
						"    small: Shadow(color: DynamicColor(light: \"0000001F\", dark: \"00000000\"), radius: 4, offset: 2),",
						"    large: Shadow(color: DynamicColor(light: \"00000026\", dark: \"00000000\"), radius: 12, offset: 4)",
						")",
					]
				)
			}
		}
	}

	var swiftUIUsageSection: some View {
		showcaseSection(
			title: "Use In SwiftUI",
			description: "Read the styleguide from the environment and apply the semantic tokens directly in view code."
		) {
			codeCard(
				title: "SwiftUI Access",
				lines: [
					"@Environment(\\.styleguide) private var styleguide",
					"",
					"Text(\"Weekly summary\")",
					"    .font(styleguide.headline2)",
					"    .foregroundStyle(styleguide.foregroundPrimary)",
					"",
					"VStack(spacing: styleguide.medium) { ... }",
				]
			)

			VStack(alignment: .leading, spacing: styleguide.medium) {
				Text("Weekly Summary")
					.font(styleguide.headline2)
					.foregroundStyle(styleguide.foregroundPrimary)

				Text("Semantic tokens keep the view code terse without giving up a shared source of truth.")
					.font(styleguide.body1)
					.foregroundStyle(styleguide.foregroundSecondary)
					.fixedSize(horizontal: false, vertical: true)

				HStack(spacing: styleguide.small) {
					showcaseBadge("Shipping")
					showcaseBadge("Accessible")
				}

				Button("Apply Styleguide") { }
					.font(styleguide.body1)
					.foregroundStyle(styleguide.backgroundPrimary)
					.padding(.horizontal, styleguide.medium)
					.padding(.vertical, styleguide.small)
					.background(styleguide.accentPrimary, in: .capsule)
			}
			.padding(styleguide.large)
			.frame(maxWidth: .infinity, alignment: .leading)
			.background(styleguide.backgroundSecondary, in: .rect(cornerRadius: 24))
			.shadow(
				color: resolvedShadowColor(for: styleguide.shadows.small),
				radius: styleguide.shadows.small.radius,
				y: styleguide.shadows.small.offset
			)
		}
	}

	var uiKitUsageSection: some View {
		showcaseSection(
			title: "Use In UIKit",
			description: "UIKit code can stay on the same semantic model through explicit namespace access, contextual shorthand, or token-level resolution."
		) {
			LazyVGrid(columns: showcaseColumns, spacing: styleguide.medium) {
				codeCard(
					title: "Contextual Assignment",
					lines: [
						"let styleguide = appStyleguide",
						"titleLabel.font = styleguide.headline3",
						"subtitleLabel.textColor = styleguide.foregroundSecondary",
						"button.tintColor = styleguide.accentPrimary",
					]
				)

				codeCard(
					title: "Typed Tokens",
					lines: [
						"let styleguide = appStyleguide",
						"let titleFont: UIFont = styleguide.headline3",
						"let accentColor: UIColor = styleguide.accentPrimary",
						"let accentToken: DynamicColor = styleguide.accentPrimary",
					]
				)

				codeCard(
					title: "Shadow Token Access",
					lines: [
						"let shadow: Styleguide.Shadow = styleguide.large",
						"layer.shadowRadius = shadow.radius",
						"layer.shadowOffset = CGSize(width: 0, height: shadow.offset)",
					]
				)
			}
		}
	}

	var colorTokenSection: some View {
		showcaseSection(
			title: "Color Tokens",
			description: "The bundled palette is semantic rather than raw-value-driven, so call sites talk about roles instead of hex values."
		) {
			colorGroup(title: "Foreground", entries: foregroundEntries)
			colorGroup(title: "Background", entries: backgroundEntries)
			colorGroup(title: "Accent", entries: accentEntries)
			colorGroup(title: "Status", entries: statusEntries)
		}
	}

	var typographySection: some View {
		showcaseSection(
			title: "Typography Tokens",
			description: "The same font token resolves to `Font` in SwiftUI and `UIFont` in UIKit."
		) {
			VStack(spacing: styleguide.medium) {
				ForEach(typographyEntries.indices, id: \.self) { index in
					let entry = typographyEntries[index]

					VStack(alignment: .leading, spacing: styleguide.small) {
						HStack(alignment: .firstTextBaseline) {
							Text(entry.name)
								.font(styleguide.body2)
								.foregroundStyle(styleguide.foregroundSecondary)

							Spacer(minLength: styleguide.medium)

							Text(verbatim: "styleguide.\(entry.name)")
								.font(codeFont)
								.foregroundStyle(styleguide.accentPrimary)
						}

						Text("The road goes ever on")
							.font(entry.token.font)
							.foregroundStyle(styleguide.foregroundPrimary)

						Text(verbatim: "UIKit: let value: UIFont = styleguide.\(entry.name)")
							.font(codeFont)
							.foregroundStyle(styleguide.foregroundTertiary)
					}
					.padding(styleguide.medium)
					.frame(maxWidth: .infinity, alignment: .leading)
					.background(styleguide.backgroundSecondary, in: .rect(cornerRadius: 20))
				}
			}
		}
	}

	var scaleSection: some View {
		showcaseSection(
			title: "Spacing And Shadows",
			description: "Spacing and shadow tokens stay semantic as well, so layouts and elevation use the same shared language."
		) {
			VStack(alignment: .leading, spacing: styleguide.medium) {
				ForEach(spacingEntries.indices, id: \.self) { index in
					let entry = spacingEntries[index]

					HStack(spacing: styleguide.medium) {
						Text(entry.name)
							.font(styleguide.body2)
							.foregroundStyle(styleguide.foregroundSecondary)
							.frame(width: 120, alignment: .leading)

						Capsule()
							.fill(styleguide.accentSecondary)
							.frame(width: max(entry.value * 6, 24), height: 12)

						Text(Double(entry.value), format: .number.precision(.fractionLength(0)))
							.font(styleguide.caption1)
							.foregroundStyle(styleguide.foregroundPrimary)
					}
				}
			}

			LazyVGrid(columns: showcaseColumns, spacing: styleguide.medium) {
				shadowCard(name: "small", shadow: styleguide.shadows.small)
				shadowCard(name: "large", shadow: styleguide.shadows.large)
			}
		}
	}

	var showcaseColumns: [GridItem] {
		[
			GridItem(.flexible(), spacing: styleguide.medium),
			GridItem(.flexible(), spacing: styleguide.medium),
		]
	}

	var codeFont: Font {
		.system(.caption, design: .monospaced)
	}

	var foregroundEntries: [(name: String, token: DynamicColor)] {
		[
			(name: "foregroundPrimary", token: styleguide.colors.foregroundPrimary),
			(name: "foregroundSecondary", token: styleguide.colors.foregroundSecondary),
			(name: "foregroundTertiary", token: styleguide.colors.foregroundTertiary),
		]
	}

	var backgroundEntries: [(name: String, token: DynamicColor)] {
		[
			(name: "backgroundPrimary", token: styleguide.colors.backgroundPrimary),
			(name: "backgroundSecondary", token: styleguide.colors.backgroundSecondary),
			(name: "backgroundTertiary", token: styleguide.colors.backgroundTertiary),
		]
	}

	var accentEntries: [(name: String, token: DynamicColor)] {
		[
			(name: "accentPrimary", token: styleguide.colors.accentPrimary),
			(name: "accentSecondary", token: styleguide.colors.accentSecondary),
			(name: "accentTertiary", token: styleguide.colors.accentTertiary),
		]
	}

	var statusEntries: [(name: String, token: DynamicColor)] {
		[
			(name: "confirmation", token: styleguide.colors.confirmation),
			(name: "warning", token: styleguide.colors.warning),
			(name: "error", token: styleguide.colors.error),
		]
	}

	var typographyEntries: [(name: String, token: Styleguide.FontToken)] {
		[
			(name: "headline1", token: styleguide.fonts.headline1),
			(name: "headline2", token: styleguide.fonts.headline2),
			(name: "headline3", token: styleguide.fonts.headline3),
			(name: "headline4", token: styleguide.fonts.headline4),
			(name: "body1", token: styleguide.fonts.body1),
			(name: "body2", token: styleguide.fonts.body2),
			(name: "caption1", token: styleguide.fonts.caption1),
			(name: "caption2", token: styleguide.fonts.caption2),
		]
	}

	var spacingEntries: [(name: String, value: CGFloat)] {
		[
			(name: "extraSmall", value: styleguide.spacing.extraSmall),
			(name: "small", value: styleguide.spacing.small),
			(name: "medium", value: styleguide.spacing.medium),
			(name: "large", value: styleguide.spacing.large),
			(name: "extraLarge", value: styleguide.spacing.extraLarge),
		]
	}

	@ViewBuilder
	func showcaseSection<Content: View>(title: String, description: String, @ViewBuilder content: () -> Content) -> some View {
		VStack(alignment: .leading, spacing: styleguide.medium) {
			Text(title)
				.font(styleguide.headline3)
				.foregroundStyle(styleguide.foregroundPrimary)

			Text(description)
				.font(styleguide.body1)
				.foregroundStyle(styleguide.foregroundSecondary)
				.fixedSize(horizontal: false, vertical: true)

			content()
		}
	}

	func showcaseBadge(_ title: String) -> some View {
		Text(title)
			.font(styleguide.caption1)
			.foregroundStyle(styleguide.accentPrimary)
			.padding(.horizontal, styleguide.small)
			.padding(.vertical, styleguide.extraSmall)
			.background(styleguide.accentSecondary, in: .capsule)
	}

	func codeCard(title: String, lines: [String]) -> some View {
		VStack(alignment: .leading, spacing: styleguide.small) {
			Text(title)
				.font(styleguide.body2)
				.foregroundStyle(styleguide.foregroundSecondary)

			VStack(alignment: .leading, spacing: styleguide.extraSmall) {
				ForEach(lines.indices, id: \.self) { index in
					Text(verbatim: lines[index])
						.font(codeFont)
						.foregroundStyle(styleguide.foregroundPrimary)
						.frame(maxWidth: .infinity, alignment: .leading)
				}
			}
		}
		.padding(styleguide.medium)
		.frame(maxWidth: .infinity, alignment: .leading)
		.background(styleguide.backgroundSecondary, in: .rect(cornerRadius: 20))
	}

	func colorGroup(title: String, entries: [(name: String, token: DynamicColor)]) -> some View {
		VStack(alignment: .leading, spacing: styleguide.small) {
			Text(title)
				.font(styleguide.headline4)
				.foregroundStyle(styleguide.foregroundPrimary)

			LazyVGrid(columns: showcaseColumns, spacing: styleguide.medium) {
				ForEach(entries.indices, id: \.self) { index in
					let entry = entries[index]

					VStack(alignment: .leading, spacing: styleguide.small) {
						RoundedRectangle(cornerRadius: 18)
							.fill(entry.token)
							.frame(height: 72)
							.overlay {
								RoundedRectangle(cornerRadius: 18)
									.stroke(styleguide.backgroundTertiary.resolvedColor(for: colorScheme), lineWidth: 1)
							}

						Text(entry.name)
							.font(styleguide.body2)
							.foregroundStyle(styleguide.foregroundPrimary)
					}
					.padding(styleguide.medium)
					.frame(maxWidth: .infinity, alignment: .leading)
					.background(styleguide.backgroundSecondary, in: .rect(cornerRadius: 20))
				}
			}
		}
	}

	func shadowCard(name: String, shadow: Styleguide.Shadow) -> some View {
		VStack(alignment: .leading, spacing: styleguide.small) {
			Text(name)
				.font(styleguide.body2)
				.foregroundStyle(styleguide.foregroundSecondary)

			VStack(alignment: .leading, spacing: styleguide.small) {
				Text("Shadow preview")
					.font(styleguide.headline4)
					.foregroundStyle(styleguide.foregroundPrimary)

				Text(verbatim: "radius: \(Int(shadow.radius)), y: \(Int(shadow.offset))")
					.font(codeFont)
					.foregroundStyle(styleguide.foregroundTertiary)
			}
			.padding(styleguide.medium)
			.frame(maxWidth: .infinity, alignment: .leading)
			.background(styleguide.backgroundPrimary, in: .rect(cornerRadius: 18))
			.shadow(color: resolvedShadowColor(for: shadow), radius: shadow.radius, y: shadow.offset)
		}
		.padding(styleguide.medium)
		.frame(maxWidth: .infinity, alignment: .leading)
		.background(styleguide.backgroundSecondary, in: .rect(cornerRadius: 20))
	}

	func resolvedShadowColor(for shadow: Styleguide.Shadow) -> Color {
		shadow.color.resolvedColor(for: colorScheme)
	}
}

private extension Styleguide {
	static let showcase = Styleguide(
		fonts: .init(
			headline1: FontToken(size: 34, textStyle: .largeTitle, weight: .bold, design: .rounded),
			headline2: FontToken(size: 22, textStyle: .title3, weight: .semibold, design: .rounded),
			headline3: FontToken(size: 17, textStyle: .headline, weight: .semibold),
			headline4: FontToken(size: 14, textStyle: .callout, weight: .semibold),
			body1: FontToken(size: 17, textStyle: .body),
			body2: FontToken(size: 14, textStyle: .callout),
			caption1: FontToken(size: 12, textStyle: .caption1, weight: .medium),
			caption2: FontToken(size: 11, textStyle: .caption2, weight: .medium)
		),
		colors: .init(
			foregroundPrimary: DynamicColor(light: 0x14213D, dark: 0xF8FAFC),
			foregroundSecondary: DynamicColor(light: 0x415A77, dark: 0xCBD5E1),
			foregroundTertiary: DynamicColor(light: 0x6C7A89, dark: 0x94A3B8),
			backgroundPrimary: DynamicColor(light: 0xFFFDF7, dark: 0x10212B),
			backgroundSecondary: DynamicColor(light: 0xF4EFE2, dark: 0x17313D),
			backgroundTertiary: DynamicColor(light: 0xE6DDC8, dark: 0x264653),
			accentPrimary: DynamicColor(light: 0xC26D00, dark: 0xF6AD55),
			accentSecondary: DynamicColor(light: 0xFFE7C2, dark: 0x5A3B06),
			accentTertiary: DynamicColor(light: 0x8B4A00, dark: 0xFBD38D),
			confirmation: DynamicColor(light: 0x2F855A, dark: 0x68D391),
			warning: DynamicColor(light: 0xB7791F, dark: 0xF6AD55),
			error: DynamicColor(light: 0xC05621, dark: 0xFC8181)
		),
		spacing: .init(),
		shadows: .init(
			small: Shadow(color: DynamicColor(light: "14213D1A", dark: "00000033"), radius: 6, offset: 3),
			large: Shadow(color: DynamicColor(light: "14213D26", dark: "00000052"), radius: 16, offset: 6)
		)
	)
}

#Preview("Default") {
	StyleguideShowcaseView()
}

#Preview("Default Dark") {
	StyleguideShowcaseView()
		.preferredColorScheme(.dark)
}

#Preview("Showcase Theme") {
	StyleguideShowcaseView()
		.styledPreview(using: .showcase)
}
