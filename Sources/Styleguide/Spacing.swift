import Foundation

public extension Styleguide {
	/// The semantic spacing scale used by a styleguide.
	struct Spacing: Sendable {
		/// Creates the spacing values for a styleguide.
		public init(extraSmall: CGFloat = 4, small: CGFloat = 8, medium: CGFloat = 16, large: CGFloat = 24, extraLarge: CGFloat = 32) {
			self.extraSmall = extraSmall
			self.small = small
			self.medium = medium
			self.large = large
			self.extraLarge = extraLarge
		}

		/// The neutral baseline spacing preset used by `Styleguide.default`.
		public static let `default` = Self()

		/// The smallest spacing token for tightly grouped content.
		public let extraSmall: CGFloat

		/// The small spacing token for compact separation.
		public let small: CGFloat

		/// The medium spacing token for default separation.
		public let medium: CGFloat

		/// The large spacing token for section separation.
		public let large: CGFloat

		/// The largest spacing token for strong section separation.
		public let extraLarge: CGFloat
	}
}
