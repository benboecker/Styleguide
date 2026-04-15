import UIKit
import SwiftUI

/// A semantic color token that stores light and dark variants for SwiftUI and UIKit.
public struct DynamicColor: Sendable, ShapeStyle {
	/// Creates a color token that uses the same hexadecimal value in both appearances.
	///
	/// Numeric values up to `0xFFFFFF` are interpreted as opaque `RRGGBB`.
	/// Numeric values from `0x1000000` to `0xFFFFFFFF` are interpreted as `RRGGBBAA`.
	public init(light: UInt64) {
		let lightValue = HexColor(light)

		self.init(light: lightValue, dark: lightValue)
	}

	/// Creates a color token with separate hexadecimal values for light and dark appearances.
	///
	/// Numeric values up to `0xFFFFFF` are interpreted as opaque `RRGGBB`.
	/// Numeric values from `0x1000000` to `0xFFFFFFFF` are interpreted as `RRGGBBAA`.
	public init(light: UInt64, dark: UInt64) {
		self.init(light: HexColor(light), dark: HexColor(dark))
	}

	/// Creates a color token that uses the same hexadecimal string in both appearances.
	///
	/// The string may optionally start with `#` or `0x` and must contain exactly
	/// 6 (`RRGGBB`) or 8 (`RRGGBBAA`) hexadecimal digits after normalization.
	public init(light: String) {
		let lightValue = HexColor(light)

		self.init(light: lightValue, dark: lightValue)
	}

	/// Creates a color token with separate hexadecimal strings for light and dark appearances.
	///
	/// Each string may optionally start with `#` or `0x` and must contain exactly
	/// 6 (`RRGGBB`) or 8 (`RRGGBBAA`) hexadecimal digits after normalization.
	public init(light: String, dark: String) {
		self.init(light: HexColor(light), dark: HexColor(dark))
	}

	private let light: HexColor
	private let dark: HexColor

	/// Resolves the token to the correct SwiftUI shape style for the current environment.
	public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
		resolvedColor(in: environment)
	}

	/// Resolves the token to a concrete SwiftUI color for a specific environment.
	func resolvedColor(in environment: EnvironmentValues) -> Color {
		resolvedColor(for: environment.colorScheme)
	}

	/// Resolves the token to a concrete SwiftUI color for a specific color scheme.
	public func resolvedColor(for colorScheme: ColorScheme) -> Color {
		switch colorScheme {
		case .light:
			light.color
		case .dark:
			dark.color
		@unknown default:
			light.color
		}
	}

	/// Returns a dynamic UIKit color that adapts to the current trait environment.
	var uiColor: UIColor {
		UIColor { traitCollection in
			resolvedUIColor(for: traitCollection)
		}
	}

	/// Resolves the token to a concrete UIKit color for a specific trait collection.
	func resolvedUIColor(for traitCollection: UITraitCollection) -> UIColor {
		switch traitCollection.userInterfaceStyle {
		case .dark:
			dark.uiColor
		case .light, .unspecified:
			light.uiColor
		@unknown default:
			light.uiColor
		}
	}

	/// A fully transparent color token for both appearances.
	static let clear = DynamicColor(light: .clear, dark: .clear)
}

private extension DynamicColor {
	/// Creates a color token from two already-parsed hexadecimal values.
	init(light: HexColor, dark: HexColor) {
		self.light = light
		self.dark = dark
	}
}
