import Foundation

extension Styleguide {
	/// The semantic spacing scale used by a styleguide.
	public struct Spacing: Sendable {
		/// Creates the spacing values for a styleguide.
		public init(extraSmall: CGFloat = 4, small: CGFloat = 8, medium: CGFloat = 16, large: CGFloat = 24, extraLarge: CGFloat = 32) {
			self.extraSmall = extraSmall
			self.small = small
			self.medium = medium
			self.large = large
			self.extraLarge = extraLarge
		}

		/// The neutral baseline spacing preset used by `Styleguide.default`.
		static let `default` = Self()

		/// The smallest spacing token for tightly grouped content.
		let extraSmall: CGFloat

		/// The small spacing token for compact separation.
		let small: CGFloat

		/// The medium spacing token for default separation.
		let medium: CGFloat

		/// The large spacing token for section separation.
		let large: CGFloat

		/// The largest spacing token for strong section separation.
		let extraLarge: CGFloat
	}
}
