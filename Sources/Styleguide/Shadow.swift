import Foundation
import SwiftUI

extension Styleguide {
	/// The semantic shadow roles used by a styleguide.
	public struct Shadows: Sendable {
		/// Creates the shadow tokens for a styleguide.
		public init(small: Shadow, large: Shadow) {
			self.small = small
			self.large = large
		}

		/// The neutral baseline shadow preset used by `Styleguide.default`.
		static let `default` = Self(
			small: Shadow(color: DynamicColor(light: "0000001F", dark: "00000000"), radius: 4, offset: 2),
			large: Shadow(color: DynamicColor(light: "00000026", dark: "00000000"), radius: 12, offset: 4)
		)

		/// The compact shadow token for subtle elevation.
		let small: Shadow

		/// The large shadow token for stronger elevation.
		let large: Shadow
	}

	/// A semantic shadow token with a color, blur radius, and vertical offset.
	public struct Shadow: Sendable {
		/// Creates a shadow token.
		public init(color: DynamicColor, radius: CGFloat, offset: CGFloat) {
			self.color = color
			self.radius = radius
			self.offset = offset
		}

		/// The semantic color used by the shadow.
		public let color: DynamicColor

		/// The blur radius for the shadow.
		public let radius: CGFloat

		/// The vertical offset for the shadow.
		public let offset: CGFloat
	}
}
