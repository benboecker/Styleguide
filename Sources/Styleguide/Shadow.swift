//
//  Shadow.swift
//  Design
//
//  Created by Benjamin Böcker on 03.01.25.
//


import SwiftUI


public extension Styleguide {
	struct Shadows: Sendable {
		public init(small: Shadow, large: Shadow) {
			self.small = small
			self.large = large
		}
		
		public let small: Shadow
		public let large: Shadow
	}
	
	struct Shadow: Sendable {
		public init(color: DynamicColor, radius: CGFloat, offset: CGFloat) {
			self.color = color
			self.radius = radius
			self.offset = offset
		}
		
		public let color: DynamicColor
		public let radius: CGFloat
		public let offset: CGFloat
	}
}
