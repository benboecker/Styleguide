import Foundation
import SwiftUI

/// The semantic token container used to define and consume app styling.
@dynamicMemberLookup
public struct Styleguide: Sendable {
	/// Creates a styleguide from semantic font, color, spacing, and shadow groups.
	public init(fonts: FontStyle, colors: ColorStyle, spacing: Spacing, shadows: Shadows) {
		self.fonts = fonts
		self.colors = colors
		self.spacing = spacing
		self.shadows = shadows
	}

	/// The semantic typography roles owned by the styleguide.
	let fonts: FontStyle

	/// The semantic color roles owned by the styleguide.
	let colors: ColorStyle

	/// The semantic spacing scale owned by the styleguide.
	let spacing: Spacing

	/// The semantic shadow roles owned by the styleguide.
	let shadows: Shadows

	/// Returns a spacing value through the dynamic-member shorthand API.
	public subscript(dynamicMember keypath: KeyPath<Spacing, CGFloat>) -> CGFloat {
		self[keypath]
	}

	/// Returns a color token through the dynamic-member shorthand API.
	public subscript(dynamicMember keypath: KeyPath<ColorStyle, DynamicColor>) -> DynamicColor {
		self[keypath]
	}

	/// Returns a UIKit color through the dynamic-member shorthand API when the call site expects `UIColor`.
	public subscript(dynamicMember keypath: KeyPath<ColorStyle, DynamicColor>) -> UIColor {
		self[keypath].uiColor
	}

	/// Returns a shadow token through the dynamic-member shorthand API.
	public subscript(dynamicMember keypath: KeyPath<Shadows, Shadow>) -> Shadow {
		self[keypath]
	}

	/// Returns a SwiftUI font through the dynamic-member shorthand API while richer font metadata stays available through `fonts`.
	public subscript(dynamicMember keypath: KeyPath<FontStyle, FontToken>) -> Font {
		self[keypath].font
	}

	/// Returns a UIKit font through the dynamic-member shorthand API when the call site expects `UIFont`.
	public subscript(dynamicMember keypath: KeyPath<FontStyle, FontToken>) -> UIFont {
		self[keypath].uiFont
	}
}

private extension Styleguide {
	subscript(_ keyPath: KeyPath<FontStyle, FontToken>) -> FontToken {
		fonts[keyPath: keyPath]
	}

	subscript(_ keyPath: KeyPath<Spacing, CGFloat>) -> CGFloat {
		spacing[keyPath: keyPath]
	}

	subscript(_ keyPath: KeyPath<ColorStyle, DynamicColor>) -> DynamicColor {
		colors[keyPath: keyPath]
	}

	subscript(_ keyPath: KeyPath<Shadows, Shadow>) -> Shadow {
		shadows[keyPath: keyPath]
	}
}
