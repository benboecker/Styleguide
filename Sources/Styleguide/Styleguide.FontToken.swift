import Foundation
import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

extension Styleguide {
	/// A semantic typography token that resolves to SwiftUI and native platform fonts.
	public struct FontToken: Sendable {
		#if canImport(UIKit)
		/// Creates a system font token with a base size, text style, weight, and design.
		public init(size: CGFloat, textStyle: UIFont.TextStyle, weight: UIFont.Weight = .regular, design: UIFontDescriptor.SystemDesign = .default) {
			self.name = nil
			self.size = size
			self.textStyle = textStyle
			self.weight = weight
			self.design = design
		}

		/// Creates a custom font token associated with a text style.
		public init(name: String, size: CGFloat, textStyle: UIFont.TextStyle) {
			self.name = name
			self.size = size
			self.textStyle = textStyle
			self.weight = .regular
			self.design = .default
		}
		#elseif canImport(AppKit)
		/// Creates a system font token with a base size, text style, weight, and design.
		public init(size: CGFloat, textStyle: NSFont.TextStyle, weight: NSFont.Weight = .regular, design: NSFontDescriptor.SystemDesign = .default) {
			self.name = nil
			self.size = size
			self.textStyle = textStyle
			self.weight = weight
			self.design = design
		}

		/// Creates a custom font token associated with a text style.
		public init(name: String, size: CGFloat, textStyle: NSFont.TextStyle) {
			self.name = name
			self.size = size
			self.textStyle = textStyle
			self.weight = .regular
			self.design = .default
		}
		#endif

		/// The custom font name for the token, if the token does not use a system font.
		let name: String?

		/// The base point size for the token.
		let size: CGFloat

		#if canImport(UIKit)
		/// The text style that drives typography scaling.
		let textStyle: UIFont.TextStyle

		/// The system font weight used when the token resolves to a system font.
		let weight: UIFont.Weight

		/// The system font design used when the token resolves to a system font.
		let design: UIFontDescriptor.SystemDesign
		#elseif canImport(AppKit)
		/// The text style that drives typography scaling.
		let textStyle: NSFont.TextStyle

		/// The system font weight used when the token resolves to a system font.
		let weight: NSFont.Weight

		/// The system font design used when the token resolves to a system font.
		let design: NSFontDescriptor.SystemDesign
		#endif

		/// The SwiftUI font for the token.
		var font: Font {
			if let name {
				return .custom(name, size: size, relativeTo: textStyle.swiftUIFontTextStyle)
			}

			return .system(size: size, weight: weight.swiftUIFontWeight, design: design.swiftUIFontDesign)
		}

		#if canImport(UIKit)
		/// The UIKit font for the token using the current trait environment.
		var uiFont: UIFont {
			uiFont(compatibleWith: nil)
		}

		/// The UIKit font for the token using a specific trait environment.
		func uiFont(compatibleWith traitCollection: UITraitCollection?) -> UIFont {
			UIFontMetrics(forTextStyle: textStyle).scaledFont(for: baseUIFont, compatibleWith: traitCollection)
		}
		#elseif canImport(AppKit)
		/// The AppKit font for the token.
		var nsFont: NSFont {
			baseNSFont
		}
		#endif
	}
}

private extension Styleguide.FontToken {
	#if canImport(UIKit)
	var baseUIFont: UIFont {
		if let name, let customFont = UIFont(name: name, size: size) {
			return customFont
		}

		let baseFont = UIFont.systemFont(ofSize: size, weight: weight)
		guard design != .default, let descriptor = baseFont.fontDescriptor.withDesign(design) else {
			return baseFont
		}

		return UIFont(descriptor: descriptor, size: size)
	}
	#elseif canImport(AppKit)
	var baseNSFont: NSFont {
		if let name, let customFont = NSFont(name: name, size: size) {
			return customFont
		}

		let baseFont = resolvedSystemNSFont()
		guard design != .default, design != .monospaced, let descriptor = baseFont.fontDescriptor.withDesign(design), let designedFont = NSFont(descriptor: descriptor, size: size) else {
			return baseFont
		}

		return designedFont
	}

	/// Returns the base AppKit system font before applying non-default design changes.
	func resolvedSystemNSFont() -> NSFont {
		if design == .monospaced {
			return .monospacedSystemFont(ofSize: size, weight: weight)
		}

		return .systemFont(ofSize: size, weight: weight)
	}
	#endif
}

#if canImport(UIKit)
private extension UIFont.TextStyle {
	var swiftUIFontTextStyle: Font.TextStyle {
		switch self {
		case .largeTitle:
			return .largeTitle
		case .title1:
			return .title
		case .title2:
			return .title2
		case .title3:
			return .title3
		case .headline:
			return .headline
		case .subheadline:
			return .subheadline
		case .body:
			return .body
		case .callout:
			return .callout
		case .footnote:
			return .footnote
		case .caption1:
			return .caption
		case .caption2:
			return .caption2
		default:
			return .body
		}
	}
}

private extension UIFont.Weight {
	var swiftUIFontWeight: Font.Weight {
		switch self {
		case .ultraLight:
			return .ultraLight
		case .thin:
			return .thin
		case .light:
			return .light
		case .medium:
			return .medium
		case .semibold:
			return .semibold
		case .bold:
			return .bold
		case .heavy:
			return .heavy
		case .black:
			return .black
		default:
			return .regular
		}
	}
}

private extension UIFontDescriptor.SystemDesign {
	var swiftUIFontDesign: Font.Design {
		switch self {
		case .default:
			return .default
		case .rounded:
			return .rounded
		case .serif:
			return .serif
		case .monospaced:
			return .monospaced
		default:
			return .default
		}
	}
}
#elseif canImport(AppKit)
private extension NSFont.TextStyle {
	var swiftUIFontTextStyle: Font.TextStyle {
		switch self {
		case .largeTitle:
			return .largeTitle
		case .title1:
			return .title
		case .title2:
			return .title2
		case .title3:
			return .title3
		case .headline:
			return .headline
		case .subheadline:
			return .subheadline
		case .body:
			return .body
		case .callout:
			return .callout
		case .footnote:
			return .footnote
		case .caption1:
			return .caption
		case .caption2:
			return .caption2
		default:
			return .body
		}
	}
}

private extension NSFont.Weight {
	var swiftUIFontWeight: Font.Weight {
		switch self {
		case .ultraLight:
			return .ultraLight
		case .thin:
			return .thin
		case .light:
			return .light
		case .medium:
			return .medium
		case .semibold:
			return .semibold
		case .bold:
			return .bold
		case .heavy:
			return .heavy
		case .black:
			return .black
		default:
			return .regular
		}
	}
}

private extension NSFontDescriptor.SystemDesign {
	var swiftUIFontDesign: Font.Design {
		switch self {
		case .default:
			return .default
		case .rounded:
			return .rounded
		case .serif:
			return .serif
		case .monospaced:
			return .monospaced
		default:
			return .default
		}
	}
}
#endif
