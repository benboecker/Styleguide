import UIKit
import SwiftUI

/// A semantic color token that stores light and dark variants for SwiftUI and UIKit.
public struct DynamicColor: Sendable, ShapeStyle {
	/// Creates a color token that uses the same packed value in both appearances.
	public init(light: HexValue) {
		self.light = light
		self.dark = light
	}

	/// Creates a color token with separate packed values for light and dark appearances.
	public init(light: HexValue, dark: HexValue) {
		self.light = light
		self.dark = dark
	}

	private let light: HexValue
	private let dark: HexValue

	/// Resolves the token to the correct SwiftUI shape style for the current environment.
	public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
		resolvedColor(in: environment)
	}

	/// Resolves the token to a concrete SwiftUI color for a specific environment.
	public func resolvedColor(in environment: EnvironmentValues) -> Color {
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
	public var uiColor: UIColor {
		UIColor { traitCollection in
			resolvedUIColor(for: traitCollection)
		}
	}

	/// Resolves the token to a concrete UIKit color for a specific trait collection.
	public func resolvedUIColor(for traitCollection: UITraitCollection) -> UIColor {
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
	public static let clear = DynamicColor(light: .clear, dark: .clear)
}
