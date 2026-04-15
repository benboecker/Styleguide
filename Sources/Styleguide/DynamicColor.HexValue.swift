import UIKit
import SwiftUI

public extension DynamicColor {
	/// A packed hexadecimal color value used by `DynamicColor`.
	///
	/// Integer literals are interpreted as opaque `RRGGBB` values.
	/// Use `.rgba(0xRRGGBBAA)` when the alpha channel must be encoded explicitly.
	struct HexValue: Sendable, ExpressibleByIntegerLiteral {
		public init(integerLiteral value: UInt64) {
			self.init(rgb: UInt(value))
		}

		/// Creates an opaque packed color value from an `RRGGBB` literal.
		public init(rgb: UInt) {
			self.rawValue = (UInt32(truncatingIfNeeded: rgb) << 8) | 0xff
		}

		private init(rawValue: UInt32) {
			self.rawValue = rawValue
		}

		private let rawValue: UInt32

		/// Creates a packed color value from an `RRGGBBAA` literal.
		public static func rgba(_ value: UInt32) -> Self {
			Self(rawValue: value)
		}

		/// A fully transparent packed color value.
		public static let clear = Self(rawValue: 0x00000000)
	}
}

extension DynamicColor.HexValue {
	var color: Color {
		Color(
			.sRGB,
			red: red,
			green: green,
			blue: blue,
			opacity: alpha
		)
	}

	var uiColor: UIColor {
		UIColor(
			red: red,
			green: green,
			blue: blue,
			alpha: alpha
		)
	}
}

private extension DynamicColor.HexValue {
	var red: Double {
		Double((rawValue >> 24) & 0xff) / 255
	}

	var green: Double {
		Double((rawValue >> 16) & 0xff) / 255
	}

	var blue: Double {
		Double((rawValue >> 8) & 0xff) / 255
	}

	var alpha: Double {
		Double(rawValue & 0xff) / 255
	}
}
