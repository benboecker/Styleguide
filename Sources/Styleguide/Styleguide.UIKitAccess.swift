import Foundation
import UIKit

public extension Styleguide {
	/// The UIKit convenience view of the styleguide for semantic colors and fonts.
	public var uiKit: UIKitAccess {
		UIKitAccess(styleguide: self)
	}

	/// A UIKit-specific namespace that resolves semantic style tokens to UIKit values.
	@dynamicMemberLookup
	public struct UIKitAccess: Sendable {
		/// The semantic styleguide that backs UIKit resolutions.
		let styleguide: Styleguide

		/// Returns a UIKit color for the requested semantic color role.
		public subscript(dynamicMember keyPath: KeyPath<ColorStyle, DynamicColor>) -> UIColor {
			styleguide.colors[keyPath: keyPath].uiColor
		}

		/// Returns a UIKit font for the requested semantic typography role.
		public subscript(dynamicMember keyPath: KeyPath<FontStyle, FontToken>) -> UIFont {
			styleguide.fonts[keyPath: keyPath].uiFont
		}
	}
}
