//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 25.08.23.
//

import Foundation
import UIKit


extension UIFont {
	
	static func compressedFont(_ style: UIFont.TextStyle, weight: UIFont.Weight = .regular) -> UIFont {
		.preferred(style, weight: weight, width: .compressed)
	}
	
	static func condensedFont(_ style: UIFont.TextStyle, weight: UIFont.Weight = .regular) -> UIFont {
		.preferred(style, weight: weight, width: .condensed)
	}
	
	static func roundedFont(_ style: UIFont.TextStyle, weight: UIFont.Weight = .regular) -> UIFont {
		.preferred(style, weight: weight, design: .rounded)
	}
	
	static func preferredFont(_ style: UIFont.TextStyle, weight: UIFont.Weight = .regular) -> UIFont {
		.preferred(style, weight: weight)
	}
	
	private static func preferred(
		_ style: UIFont.TextStyle = .body,
		weight: UIFont.Weight = .regular,
		design: UIFontDescriptor.SystemDesign = .default,
		width: UIFont.Width = .standard
	) -> UIFont {
		
		var descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
		
		let traits: [UIFontDescriptor.TraitKey: Any] = [
			.width: width,
			.weight: weight
		]
		
		descriptor = descriptor
			.addingAttributes([.traits: traits])
			.withDesign(design)!
		
		let uiFont = UIFont(descriptor: descriptor, size: descriptor.pointSize)
		
		return uiFont
	}
}
