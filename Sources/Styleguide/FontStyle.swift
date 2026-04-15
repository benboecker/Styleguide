//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 20.04.24.
//

import Foundation
import SwiftUI


public extension Styleguide {
	struct FontStyle: Sendable {
		public init(
			headline1: Font,
			headline2: Font,
			headline3: Font,
			headline4: Font,
			body1: Font,
			body2: Font,
			caption1: Font,
			caption2: Font
		) {
			self.headline1 = headline1
			self.headline2 = headline2
			self.headline3 = headline3
			self.headline4 = headline4
			self.body1 = body1
			self.body2 = body2
			self.caption1 = caption1
			self.caption2 = caption2
		}
		
		public let headline1: Font
		public let headline2: Font
		public let headline3: Font
		public let headline4: Font
		public let body1: Font
		public let body2: Font
		public let caption1: Font
		public let caption2: Font
	}
}


