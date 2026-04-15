//
//  DynamicColor.swift
//  Design
//
//  Created by Benjamin Böcker on 03.01.25.
//

import SwiftUI


public struct DynamicColor: ShapeStyle {
	public init(light: UInt) {
		self.light = Color(hex: light)
		self.dark = Color(hex: light)
	}
	
	public init(light: UInt, dark: UInt) {
		self.light = Color(hex: light)
		self.dark = Color(hex: dark)
	}
	
	public init(light: Color) {
		self.light = light
		self.dark = light
	}
	
	public init(light: Color, dark: Color) {
		self.light = light
		self.dark = dark
	}

	private let light: Color
	private let dark: Color
	
	@Environment(\.colorScheme) private var colorScheme
	
	public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
		if environment.colorScheme == .light {
			return light
		} else {
			return dark
		}
	}
	
	public static let clear: DynamicColor = DynamicColor(light: .clear, dark: .clear)
	
	public var color: Color {
		light
		//colorScheme == .light ? light : dark
	}
	
	public var gradient: AnyGradient {
		color.gradient
	}
}

public extension ShapeStyle where Self == DynamicColor {
	var gradient: AnyGradient {
		self.gradient
	}
}


extension Color {
	init(hex: UInt, alpha: Double = 1) {
		self.init(
			.sRGB,
			red: Double((hex >> 16) & 0xff) / 255,
			green: Double((hex >> 08) & 0xff) / 255,
			blue: Double((hex >> 00) & 0xff) / 255,
			opacity: alpha
		)
	}
}
