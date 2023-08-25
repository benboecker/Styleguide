// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit



public extension UIColor {
	
}


extension UIColor {
	convenience init(hex: Int, alpha: CGFloat = 1.0) {
		let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
		let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
		let blue = CGFloat((hex & 0xFF)) / 255.0
		
		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}
	
	convenience init(light: Int, dark: Int) {
		self.init(dynamicProvider: { traitCollection -> UIColor in
			switch traitCollection.userInterfaceStyle {
			case .dark: return UIColor(hex: dark)
			case .light: return UIColor(hex: light)
			case .unspecified: return UIColor(hex: light)
			@unknown default: return UIColor(hex: light)
			}
		})
	}
}
