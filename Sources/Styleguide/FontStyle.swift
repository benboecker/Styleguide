import Foundation
import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

extension Styleguide {
	/// The semantic typography roles used by a styleguide.
	public struct FontStyle: Sendable {
		/// Creates the typography tokens for a styleguide.
		public init(headline1: FontToken, headline2: FontToken, headline3: FontToken, headline4: FontToken, body1: FontToken, body2: FontToken, caption1: FontToken, caption2: FontToken) {
			self.headline1 = headline1
			self.headline2 = headline2
			self.headline3 = headline3
			self.headline4 = headline4
			self.body1 = body1
			self.body2 = body2
			self.caption1 = caption1
			self.caption2 = caption2
		}

		/// The neutral baseline typography preset used by `Styleguide.default`.
		static let `default` = Self(
			headline1: FontToken(size: 34, textStyle: .largeTitle, weight: .bold),
			headline2: FontToken(size: 22, textStyle: .title3, weight: .semibold),
			headline3: FontToken(size: 17, textStyle: .headline, weight: .semibold),
			headline4: FontToken(size: 14, textStyle: .callout, weight: .semibold),
			body1: FontToken(size: 17, textStyle: .body),
			body2: FontToken(size: 14, textStyle: .callout),
			caption1: FontToken(size: 12, textStyle: .caption1, weight: .medium),
			caption2: FontToken(size: 11, textStyle: .caption2, weight: .medium)
		)

		/// The primary large-display typography token.
		public let headline1: FontToken

		/// The secondary large-display typography token.
		public let headline2: FontToken

		/// The primary section-heading typography token.
		public let headline3: FontToken

		/// The compact section-heading typography token.
		public let headline4: FontToken

		/// The primary body typography token.
		public let body1: FontToken

		/// The compact body typography token.
		public let body2: FontToken

		/// The primary caption typography token.
		public let caption1: FontToken

		/// The compact caption typography token.
		public let caption2: FontToken
	}
}
