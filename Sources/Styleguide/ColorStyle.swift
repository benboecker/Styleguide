//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 20.04.24.
//

import Foundation
import SwiftUI

public extension Styleguide {
	struct ColorStyle: Sendable {
		public init(
			foregroundPrimary: DynamicColor,
			foregroundSecondary: DynamicColor,
			foregroundTertiary: DynamicColor,
			backgroundPrimary: DynamicColor,
			backgroundSecondary: DynamicColor,
			backgroundTertiary: DynamicColor,
			accentPrimary: DynamicColor,
			accentSecondary: DynamicColor,
			accentTertiary: DynamicColor,
			confirmation: DynamicColor,
			warning: DynamicColor,
			error: DynamicColor
		) {
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
		
		public let foregroundPrimary: DynamicColor
		public let foregroundSecondary: DynamicColor
		public let foregroundTertiary: DynamicColor
		public let backgroundPrimary: DynamicColor
		public let backgroundSecondary: DynamicColor
		public let backgroundTertiary: DynamicColor
		public let accentPrimary: DynamicColor
		public let accentSecondary: DynamicColor
		public let accentTertiary: DynamicColor
		public let confirmation: DynamicColor
		public let warning: DynamicColor
		public let error: DynamicColor
	}
}

