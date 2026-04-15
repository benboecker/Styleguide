//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 11.05.24.
//

import Foundation


public extension Styleguide {
	struct Spacing: Sendable {
		public init(
			extraSmall: CGFloat = 4,
			small: CGFloat = 8,
			medium: CGFloat = 16,
			large: CGFloat = 32,
			extraLarge: CGFloat = 48
		) {
			self.extraSmall = extraSmall
			self.small = small
			self.medium = medium
			self.large = large
			self.extraLarge = extraLarge
		}
		
		public let extraSmall: CGFloat
		public let small: CGFloat
		public let medium: CGFloat
		public let large: CGFloat
		public let extraLarge: CGFloat
	}
}

