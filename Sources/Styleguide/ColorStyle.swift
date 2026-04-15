import Foundation
import SwiftUI

public extension Styleguide {
	/// The semantic color roles used by a styleguide.
	struct ColorStyle: Sendable {
		/// Creates the semantic colors for a styleguide.
		public init(foregroundPrimary: DynamicColor, foregroundSecondary: DynamicColor, foregroundTertiary: DynamicColor, backgroundPrimary: DynamicColor, backgroundSecondary: DynamicColor, backgroundTertiary: DynamicColor, accentPrimary: DynamicColor, accentSecondary: DynamicColor, accentTertiary: DynamicColor, confirmation: DynamicColor, warning: DynamicColor, error: DynamicColor) {
			self.foregroundPrimary = foregroundPrimary
			self.foregroundSecondary = foregroundSecondary
			self.foregroundTertiary = foregroundTertiary
			self.backgroundPrimary = backgroundPrimary
			self.backgroundSecondary = backgroundSecondary
			self.backgroundTertiary = backgroundTertiary
			self.accentPrimary = accentPrimary
			self.accentSecondary = accentSecondary
			self.accentTertiary = accentTertiary
			self.confirmation = confirmation
			self.warning = warning
			self.error = error
		}

		/// The neutral baseline color preset used by `Styleguide.default`.
		public static let `default` = Self(
			foregroundPrimary: DynamicColor(light: 0x111827, dark: 0xF9FAFB),
			foregroundSecondary: DynamicColor(light: 0x4B5563, dark: 0xD1D5DB),
			foregroundTertiary: DynamicColor(light: 0x6B7280, dark: 0x9CA3AF),
			backgroundPrimary: DynamicColor(light: 0xFFFFFF, dark: 0x111827),
			backgroundSecondary: DynamicColor(light: 0xF3F4F6, dark: 0x1F2937),
			backgroundTertiary: DynamicColor(light: 0xE5E7EB, dark: 0x374151),
			accentPrimary: DynamicColor(light: 0x2563EB, dark: 0x60A5FA),
			accentSecondary: DynamicColor(light: 0xDBEAFE, dark: 0x1E3A8A),
			accentTertiary: DynamicColor(light: 0x1D4ED8, dark: 0xBFDBFE),
			confirmation: DynamicColor(light: 0x15803D, dark: 0x4ADE80),
			warning: DynamicColor(light: 0xB45309, dark: 0xFBBF24),
			error: DynamicColor(light: 0xB91C1C, dark: 0xF87171)
		)

		/// The primary foreground color for readable content.
		public let foregroundPrimary: DynamicColor

		/// The secondary foreground color for supporting content.
		public let foregroundSecondary: DynamicColor

		/// The tertiary foreground color for subtle supporting content.
		public let foregroundTertiary: DynamicColor

		/// The primary background color for surfaces.
		public let backgroundPrimary: DynamicColor

		/// The secondary background color for nested surfaces.
		public let backgroundSecondary: DynamicColor

		/// The tertiary background color for emphasized nested surfaces.
		public let backgroundTertiary: DynamicColor

		/// The primary accent color for key emphasis.
		public let accentPrimary: DynamicColor

		/// The secondary accent color for softer emphasis.
		public let accentSecondary: DynamicColor

		/// The tertiary accent color for strong accent contrast.
		public let accentTertiary: DynamicColor

		/// The semantic success color.
		public let confirmation: DynamicColor

		/// The semantic warning color.
		public let warning: DynamicColor

		/// The semantic error color.
		public let error: DynamicColor
	}
}
