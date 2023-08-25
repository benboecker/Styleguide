//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 25.08.23.
//

import Foundation
import UIKit
import SwiftUI


public extension UIColor {
	static let s_accent = UIColor(light: 0x8e44ad, dark: 0x8e44ad)
	static let s_shadow = UIColor(light: 0x000000, dark: 0x000000)
	
	static let s_primaryBackground = UIColor(light: 0xEEEEEE, dark: 0x000000)
	static let s_secondaryBackground = UIColor(light: 0xFFFFFF, dark: 0x000000)
	static let s_tertiaryBackground = UIColor(light: 0xFFFFFF, dark: 0x000000)

	static let s_primaryText = UIColor(light: 0x222222, dark: 0xEEEEEE)
	static let s_secondaryText = UIColor(light: 0xAAAAAA, dark: 0xFFFFFF)
}


public extension Color {
	static let s_accent = Color(uiColor: .s_accent)
	static let s_shadow = Color(uiColor: .s_shadow)
	
	static let s_primaryBackground = Color(uiColor: .s_primaryBackground)
	static let s_secondaryBackground = Color(uiColor: .s_secondaryBackground)
	static let s_tertiaryBackground = Color(uiColor: .s_tertiaryBackground)
	
	static let s_primaryText = Color(uiColor: .s_primaryText)
	static let s_secondaryText = Color(uiColor: .s_secondaryText)

}


#Preview("Colors", traits: .fixedLayout(width: 300, height: 800)) {
	VStack(spacing: 4) {
		DescriptionLabel("Accent", .primary)
		Color.s_accent
	
		DescriptionLabel("Shadow", .primary)
		Color.s_shadow
		
		DescriptionLabel("Primary Background", .primary)
		Color.s_primaryBackground
		
		DescriptionLabel("Secondary Background", .primary)
		Color.s_secondaryBackground
		
		DescriptionLabel("Tertiary Background", .primary)
		Color.s_tertiaryBackground
		
		DescriptionLabel("Primary Text", .primary)
		Color.s_primaryText
		
		DescriptionLabel("Secondary text", .primary)
		Color.s_secondaryText
	}
}

struct DescriptionLabel: View {
	init(_ title: String, _ color: Color) {
		self.title = title
		self.color = color
	}
	
	let title: String
	let color: Color
	var body: some View {
		Text(title)
			.font(.system(.title3, weight: .bold).width(.compressed))
			.foregroundStyle(color)
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.top, 16)
			.padding(.leading, 4)
	}
}
