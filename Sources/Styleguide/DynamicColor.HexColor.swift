import Foundation
import UIKit
import SwiftUI

extension DynamicColor {
	/// An internal hexadecimal color value used by `DynamicColor`.
	///
	/// Numeric values up to `0xFFFFFF` are interpreted as opaque `RRGGBB` values.
	/// Numeric values from `0x1000000` to `0xFFFFFFFF` are interpreted as `RRGGBBAA`.
	/// Use the string initializer for leading-zero `RRGGBBAA` values such as `"0000001F"`.
	struct HexColor: Sendable {
		/// The normalized red component in the range `0...1`.
		let red: Double

		/// The normalized green component in the range `0...1`.
		let green: Double

		/// The normalized blue component in the range `0...1`.
		let blue: Double

		/// The normalized alpha component in the range `0...1`.
		let alpha: Double

		/// Creates a hexadecimal color value from a numeric input.
		///
		/// Values up to `0xFFFFFF` are interpreted as opaque `RRGGBB`.
		/// Values up to `0xFFFFFFFF` are interpreted as `RRGGBBAA`.
		init(_ value: UInt64) {
			precondition(value <= 0xFFFFFFFF, "HexColor only supports values up to 0xFFFFFFFF.")

			if value <= 0xFFFFFF {
				self.init(
					redByte: (value >> 16) & 0xFF,
					greenByte: (value >> 8) & 0xFF,
					blueByte: value & 0xFF,
					alphaByte: 0xFF
				)
				return
			}

			self.init(
				redByte: (value >> 24) & 0xFF,
				greenByte: (value >> 16) & 0xFF,
				blueByte: (value >> 8) & 0xFF,
				alphaByte: value & 0xFF
			)
		}

		/// Creates a hexadecimal color value from a string input.
		///
		/// The string may optionally start with `#` or `0x` and must contain exactly
		/// 6 (`RRGGBB`) or 8 (`RRGGBBAA`) hexadecimal digits after normalization.
		init(_ value: String) {
			let normalizedValue = Self.normalizedHexString(from: value)
			guard let parsedValue = UInt64(normalizedValue, radix: 16) else {
				preconditionFailure("HexColor strings must contain only hexadecimal digits.")
			}

			switch normalizedValue.count {
			case 6:
				self.init(
					redByte: (parsedValue >> 16) & 0xFF,
					greenByte: (parsedValue >> 8) & 0xFF,
					blueByte: parsedValue & 0xFF,
					alphaByte: 0xFF
				)
			case 8:
				self.init(
					redByte: (parsedValue >> 24) & 0xFF,
					greenByte: (parsedValue >> 16) & 0xFF,
					blueByte: (parsedValue >> 8) & 0xFF,
					alphaByte: parsedValue & 0xFF
				)
			default:
				preconditionFailure("HexColor strings must contain exactly 6 or 8 hexadecimal digits.")
			}
		}

		/// Creates a normalized color from byte-sized RGBA components.
		private init(redByte: UInt64, greenByte: UInt64, blueByte: UInt64, alphaByte: UInt64) {
			red = Self.normalizedComponent(from: redByte)
			green = Self.normalizedComponent(from: greenByte)
			blue = Self.normalizedComponent(from: blueByte)
			alpha = Self.normalizedComponent(from: alphaByte)
		}

		/// A fully transparent color value.
		static let clear = Self(redByte: 0x00, greenByte: 0x00, blueByte: 0x00, alphaByte: 0x00)
	}
}

extension DynamicColor.HexColor {
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

private extension DynamicColor.HexColor {
	/// Removes supported prefixes and surrounding whitespace from a hexadecimal string input.
	static func normalizedHexString(from value: String) -> String {
		let trimmedValue = value.trimmingCharacters(in: .whitespacesAndNewlines)

		if trimmedValue.hasPrefix("#") {
			return String(trimmedValue.dropFirst())
		}

		if trimmedValue.hasPrefix("0x") || trimmedValue.hasPrefix("0X") {
			return String(trimmedValue.dropFirst(2))
		}

		return trimmedValue
	}

	/// Converts a byte-sized component into a normalized color component.
	static func normalizedComponent(from value: UInt64) -> Double {
		Double(value) / 255
	}
}
